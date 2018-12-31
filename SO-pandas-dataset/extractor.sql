-- TO DO:
-- exclude rolled-back edits from contributor list?
-- detect locked and migrated questions
-- make a whole-network version that returns posts from all SE sites


-- first find all posts by user (plus some other useful keys for joins)
create table #PostsByUser (
  PostId int primary key,
  ParentId int,
  PostTypeId int
)
insert into #PostsByUser
select
  Id as PostId, ParentId, PostTypeId
from
  Posts
where
OwnerUserId in (2411802, 2901002, 1427416, 653364, 704848, 487339, 190597, 644898, 776560, 1240268) -- pass the IDs here. 10 at a time
;

with
PostsByUser as (
  select * from #PostsByUser
),
-- find last body revision of each post (for Markdown content)
LastRevisions as (
  select
    PostsByUser.PostId as PostId,
    max(PostHistory.Id) as LastRevId
  from
    PostsByUser
    join PostHistory on PostHistory.PostId = PostsByUser.PostId
  where
    PostHistory.PostHistoryTypeId in (2,5,8)  -- create/edit/rollback body
  group by
    PostsByUser.PostId
),
-- find all editors for each post
Editors as (
  select
    PostHistory.PostId as PostId,
    PostHistory.UserId as UserId,
    coalesce(Users.DisplayName, PostHistory.UserDisplayName) as UserName,
    min(PostHistory.CreationDate) as FirstEditDate
  from
    PostsByUser
    join PostHistory on PostHistory.PostId = PostsByUser.PostId
    left join Users on Users.Id = PostHistory.UserId
  where
    PostHistory.PostHistoryTypeId in (4,5)  -- edit body/title
  group by
    PostHistory.PostId,
    PostHistory.UserId,
    coalesce(Users.DisplayName, PostHistory.UserDisplayName)
),
EditorsGrouped as (
  select
    PostId,
    string_agg(UserName + ' (' + coalesce(cast(UserId as nvarchar), 'n/a') + ')', ', ')
      within group ( order by FirstEditDate asc ) as EditorNames
  from
    Editors
  group by
    PostId
),
-- find tags for tag wiki posts and excerpts
WikiTags as (
  select
    PostId, TagName
  from
    PostsByUser
    join Tags on PostId = ExcerptPostId
  where
    PostTypeId = 4  -- tag excerpt
union
  select
    PostId, TagName
  from
    PostsByUser
    join Tags on PostId = WikiPostId
  where
    PostTypeId = 5  -- tag wiki
),
-- find duplicate questions
Dupes as (
  select distinct
    PostsByUser.PostId
  from
    PostsByUser
    join PostLinks on PostLinks.PostId = PostsByUser.PostId
  where
    PostTypeId = 1 and LinkTypeId = 3  -- question, duplicate
)

-- now select the actual result data
select
  Posts.Id as [Post Link],
  PostTypes.Name as [Type],
  coalesce(Posts.Title, Parent.Title) as [Title],  
  PostHistory.Text as [Markdown],
  coalesce(WikiTags.TagName, Posts.Tags, Parent.Tags) as [Tags],
  Posts.CreationDate as [Created],
  Posts.LastEditDate as [Last Edit],
  EditorNames as [Edited By],
  Posts.Score as [Score],
  Posts.FavoriteCount as [Favorites],
  coalesce(Posts.ViewCount, Parent.ViewCount) as [Views],
  Posts.AnswerCount as [Answers],
  iif(Posts.AcceptedAnswerId is not null or Posts.Id = Parent.AcceptedAnswerId, 'Accepted', null) as [Accepted],
  iif(Posts.CommunityOwnedDate is not null, 'CW', null) as [CW],
  iif(Posts.ClosedDate is not null, iif(Dupes.PostId is not null, 'Duplicate', 'Closed'), null) as [Closed]
from
  PostsByUser
  join Posts on Posts.Id = PostsByUser.PostId
  left join PostTypes on PostTypes.Id = PostsByUser.PostTypeId
  left join Posts as Parent on Parent.Id = PostsByUser.ParentId
  left join LastRevisions on LastRevisions.PostId = PostsByUser.PostId
  left join PostHistory on PostHistory.Id = LastRevisions.LastRevId
  left join EditorsGrouped on EditorsGrouped.PostId = PostsByUser.PostId
  left join WikiTags on WikiTags.PostId = PostsByUser.PostId
  left join Dupes on Dupes.PostId = PostsByUser.PostId
