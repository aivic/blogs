## Introduction
The CSS has become a common choice for most of the animators working in the industry to attain perfection right from simple to advance animation. This is one of the key reasons why more components are being added to the CSS day by day making it more powerful than ever before and not to mention even at par or surpassing the HTML component. The situation is that nowadays the order of the HTML elements in the output won’t make a difference to the page in terms of display standpoint. It doesn’t matter whether we are talking about the small or the large layout; CSS is there to help you out in every way possible.  
 
Let’s keep the accessibility and the semantics aside, and focus on the tactic that could enable you to render the elements in the reverse chronological order with the help of CSS. By the end of this guide, it would be feasible for you to attain the best results when it comes to the process of rendering the list in the reverse order in the most convenient manner. 

## A Simple Case Study 
Let us have a glance on the following situation where as per your priority or requirement you are required to display certain elements horizontally or vertically as shown below:


```html
<ul >
    <li > One </li>
    <li > Two </li>
    <li > Three </li>
    <li > Four </li>
    <li > Five </li>
    <li > Six </li>
    <li > Seven </li>
    <li > Eight </li>
    <li > Nine </li>
    <li > Ten </li>
</ul>
```

Whether the change is taking place vertically or horizontally, there has to be a change in the value of the `flex-direction` in order to reverse concerned order of the components. The commands that would be used in order to make the adjustment in the order are shown below:


```css
/* show reverse by horizontal row */
.row-reverse { display: flex; flex-direction: row-reverse; }

/* show reverse by vertical column */
.column-reverse { display: flex; flex-direction: column-reverse; }
```

From the above code, it is not hard to study that the row-reverse command publishes the elements in the reverse order in the horizontal direction. On the other hand, column-reverse is going to ensure the publishing of the components in vertical reverse order. 

Now, just have a look at the result that we have achieved in the row reverse and the column reverse in CSS. The elements which are presented in list down below are numeric in order but as you can see successfully displayed in the reverse order. 

![Imgur](https://i.imgur.com/8nO7YpL.png)

Now, as you can see that we have successfully accomplished the list reordering task in CSS. When you face the problem related with AngularJS too then this technique is quite an effective measure to handle the situation. The problem with the AngularJS is that one tends to repeat over a specific object’s keys, while at the same time there is no precise way to reinstate over those keys in the reverse order concerned from the template. That is the reason why the reversal of the elements with the help of CSS can actually curtail the problem to a significant extent. 

Well, we all know how much the animator and the programmers anticipated from Flexbox when it was introduced for the first time. It was considered to be a revolutionary term and meant to transform CSS in several remarkable ways. But with the passage of time, the shine of Flexbox also dwindled but the good news is that there are certain tricks in the books of Flexbox that can actually help you out in the real time need. It is fully expected that horizons of the Flexbox is going to expand in the due course of time and it get the recognition that it truly deserves. 

At the present moment, we are rendering the list in typical React JS style format. It is the list which has been passed as array prop, so whenever a new kind of element is included, it forms like the newest item has been incorporated at the end of list. 

But the approach that we are going to focus down here is to bring the newest item to the top and make the whole list appear in the reverse order. Now, there are two approaches of conducting the same. One is to reverse the whole list and form a new array every time something new is added. After that, pass down this reversed list in the form of the prop. Second approach is the application of `Shift`. But both of them are seldom used due to the lack of performance.

If you are planning to pick the choice of reversing the list by applying `reverse()`, `shift()` or `splice()`, then it is recommended that you create a shallow copy of concerned array in priority, thereafter apply the function on that specific copy. 

For instance,


```javascript
[...this.props.myList].reverse().map(createListItem, this)
```

or,


```javascript
this.props.myList.slice(0).map(createListItem, this)
```

It is important to note that the Props in React JS should not mutate under any circumstances.

## Conclusion
With the completion of this guide, we have successfully learned a lot many things about rendering a list in the reverse order. We have learned giving the `flex-direction` display to the horizontal row reverse as well as the vertical column reverse in CSS. The addition of the props also plays a crucial role and I do hope you understood it well.  

## References
While writing this guide, the following resources have been referred to:
- [David Walsh, Reverse Element Order with CSS Flexbox, Retrieved on June 21, 2019](https://davidwalsh.name/css-reverse)
- [React: Given an Array, Render the Elements in Reverse Order Efficiently, Retrieved on June 21, 2019](https://stackoverflow.com/questions/37664041/react-given-an-array-render-the-elements-in-reverse-order-efficiently?rq=1)
