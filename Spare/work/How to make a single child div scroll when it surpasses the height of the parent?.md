## Introduction
The scrolling style of animation component is a key area where you can learn new skill sets at every level and give their animation expertise a dynamic approach. The level of animation increases once the animator reaches down to the single child component and try to improvise its status against the parent element. The experienced professionals in this field would be well verse with this opinion that careful measures are required to be taken when changes in the features of the child component is being made with respect to the ones possessed by the parent component. It is basically due to the fact that one slight mistake can generate errors in the functioning of the entire framework. 

In this guide, our objective is to learn how to make a single child div scroll when it surpasses the height of its parent component. 

## A Demo To Start With 
In order to make the demonstration function precisely, let us have a glance over the situation mentioned below: 

There are two child divs which are nested within a parent component div in the given row-column array. The parent component is denoted by columns, whereas the rows represent the children. 

IMG 3

There are certain aspects that we have set uptight for the case in order to avail the inference right as per the need. The upper child div is going to be of the variable height; but it's fully assured that the height of the concerned child div be less in comparison to that of the parent div.

In the case of the lower child, it also comprises of the variable height. It is important to note that in certain cases, it's the heights of child divs that actually result in lower child div to surpass the height that of the parent. The case that we are talking in particular is going to be customized to ensure that the lower child div is scrollable in nature. Do consider the fact that it is only lower div which is meant to be scrolled without influencing the whole parent div in any way. 

**How to make this happen? **
Let us start with the HTML commands: 


```html
 <div class = "parent" >
    <div class = "child1" >
        Hello, world!
    </ div>
    <div class = "child2" >
        This div should overflow and scroll down.
    </ div>
</ div>
```

And, for the CSS:


```css
.parent {
    width: 50px;
    height: 100px;
    border: 1px solid black;
}

.child1 {
    background-color: red;
}

.child2 {
    background-color: blue;
}
```

Here, it is advisable that the scroller for the parent component is not functional yet. It is in existence for the parent to make the whole framework look realistic. An existing yet non-functional scroller is one of the keys that is required to be taken into account to get the expected results. 

The `overflow` is only being functional when you give it the value which is greater than the existing one. 


```javascript
$(document).ready(function() {
  $(".child2").css("max-height", ($(".parent").height()-$(".child1").height()));
});
```

In order to include the `overflow` for the children, the commands to be added are as follows:


```css
.child1 {
    background-color: red;
    overflow: hidden;
}

.child2 {
    background-color: blue;
    overflow: auto;
}
```

Refer the given [JSFiddle](http://jsfiddle.net/m9goxrbk/) for a live demo.

## Using Flexbox
Apart from the solution which is highlighted above, one can also go with the solution with the application of flexbox. If you are thinking that the process with flexbox is going to be a complicated one then you cannot be more wrong. The process is very simple as you can see `display: flex`, `flex-direction: column` and `overflow: hidden` for the parent as well as `overflow-y: auto` for the child. 


```css
.wrapper {
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.scrollable-child {
  overflow-y: auto;
}
```

## Overflow Property
The application of the overflow property to scroll the whole parent div can be seen in the code below, whose live demo can be verified on given [JSFiddle](http://jsfiddle.net/0yxnaywu/2/):


```css
.parent {
    width: 50px;
    height: 100px;
    border: 1px solid black;
    overflow: auto;
}
```

If you wish to make only the second div scrollable then you are required to alter the height `30px` so that child1 as well as child2 can be fit precisely with the height of parent as well as incorporate the overflow property. The corresponding commands are shown below:


```css
.parent {
    width: 50px;
    height: 100px;
    border: 1px solid black;
}

.child1 {
    height: 70px;
    background-color: red;
}

.child2 {
    height: 30px;
    background-color: blue;
    overflow: auto;
}
```

You can also verify the above commands in the given [JSFiddle](http://jsfiddle.net/0yxnaywu/3/).

## Conclusion 
The process of making a single child div scroll while working totally distinct from the parent div is achievable as we have learned throughout this guide. The solutions lay down by both CSS and Flexbox have been discussed. The application of the components to create a single child scroll can be effective when all the related aspects are precisely measured. 

It is advisable to follow the above given steps and ascertain selective animation as per the need. 

## References
While writing this guide, the following resource has been referred:
- [Stack Overflow - How To Make Child div Scrollable When It Exceeds Parent Height?, Referred on June 19, 2019](https://stackoverflow.com/questions/27784727/how-to-make-child-div-scrollable-when-it-exceeds-parent-height)
