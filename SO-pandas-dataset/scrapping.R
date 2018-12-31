library(rvest)
library(stringr)
features <- c("div.user-details a")

  
main_site <- paste("https://stackoverflow.com/help/badges/3296/pandas")
main_site <- read_html(url(main_site,'rb'))
  
content <- data.frame(html_nodes(main_site,features) %>% html_attr("href"))

names(content) <- 'title'
content <- str_split_fixed(content$title, "/", 5)[,c(3, 4)]
write.csv(file = 'D:\\SO_users.csv',data.frame(content))

# --------------------- extracting data in comma format to be put in API -----------------------
as.numeric(content[,1])
s <- "3483203 3877338 6671176 4124317 2487184 6207849  624829 6287308 3510736 3339965 9209546 1552748 3707607 1889400 1494637 4800652 3293881 7964527 4909087 6361531 2137255 3657742  625914 1744834 2285236 4983450  772649 3923281 5741205 2336654 2411802 2901002 1427416  653364  704848  487339  190597  644898  776560 1240268"
gsub("\\s+",", ",s)
