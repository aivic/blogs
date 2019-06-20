## Introduction 
In this guide, we are going to learn an approach to animate newly appended element in React JS. For this scenario, we are going to take the case of a React component applying `ReactCSSTransitionGroup` for the CSS transitions with the server up and running in a fluent manner with dummy database as well as an application programming interface (API) returning an array of specific objects and then calling them for the testing purposes. A `setTimeout` has been applied in order to query with the concerned API URL.

## The React Programming 
The programming to obtain the results in the process can be understood from the following code:


```javascript
var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

var ItemsList = React.createClass({
    getInitialState: function() {
        return {
            items: [],
            api: {
                getItems: '/api/items'
            }
        }
    },

    componentDidMount: function() {
        this.fetchData();
    },

    fetchData: function() {
        $.get(this.state.api.getItems, function(data) {               
            this.setState({
              items: data
            });
            setTimeout(this.fetchData, 3000);
        }.bind(this));
    },

    render: function() {
        var items = this.state.items.map(function(item, index) {
            return (
                <div className = "title" key = {index} >                                             
                    {item.title}                    
                </ div>
            );
        }.bind(this));
        return (
            <div className = "content" >
                <ReactCSSTransitionGroup transitionName = "example" >
                    {items}
                </ ReactCSSTransitionGroup>
            </ div>      
        );  
    }
});

React.render(
    <ItemsList />,
    document.querySelector('.react')
);
```

And the corresponding CSS code:


```css
.example-enter {
   opacity: 0.01;
}

.example-enter.example-enter-active {
   opacity: 1;
   transition: opacity 2.5s ease-in;
}

.example-leave {
   opacity: 1;
}

.example-leave.example-leave-active {
   opacity: 0.01;
   transition: opacity 2.5s ease-in;
}
```

Now, the question that arises, how to proceed if you'd like to add an item to the array. If you proceed with `orderBy created_at DESC` running in the PHP and then it would return all the objects related to it in a successful manner. But, as per the case of a React JS component, the rendering of the new object is going to take place at the top and then the animation of the last element is done. The animation is done irrespective of the fact whether a new element is added to the top or not; candidly speaking it won't make any difference.

If you are facing any sort of error with the compatibility then it is advisable to take the following measures in order to rectify the same. 


```javascript
<div className = "title" key = {item.id} >
     {item.title}
</ div>
```

The above change is done as a substitute of:


```javascript
<div className = "title" key = {index} >
     {item.title}
</ div>
```

Here, it is worth mentioning that the Index comes directly from an array and whenever an element is incorporated, change will happen to it.

## Newly Appended Element in a Dynamic Web Page
If we look at the demonstration of newly appended elements using React JS in a dynamic web page, then it would look like the following:

IMG 1

As you can see the dialogue boxes automatically appear in the rows when the individual click on the `Load more` button and expect for the results to flow down simultaneously. 

IMG 2

Now, as you can see in the rows of these dummy items, it is essential that all the boxes do adjust with the margins and can be loaded in a fast and seamless manner. It is quite a critical factor, as if a demanding visitor once makes a visit to the website, it is essential that the concerned items can render swift results to make the time spent on the page worthwhile. 

When we see the animation of the newly appended component in React JS with the full HTML, CSS and Javascript code, then it would look like the following:

**HTML**


```html
<div class = "boxes-container" data-boxes-cont >
    <div class = "box" >
        <h3 class = "box-title" > Hi! </ h3>
        <p class = "box-content" > Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit. </ p>
    </ div>
    <div class = "box" >
        <h3 class = "box-title" > Hi! </ h3>
        <p class = "box-content" > Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit. </ p>
    </ div>
    <div class = "box" >
        <h3 class = "box-title" > Hi! </ h3>
        <p class = "box-content" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit.</ p>
    </ div>
    <div class = "box" >
        <h3 class = "box-title" > Hi! </ h3 >
        <p class = "box-content" > Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit. </ p>
    </ div>
</ div>
<div class = "link-wrapper" >
    <a href = "#" class = "load-more" data-more > Load more </ a>
</ div>
<script type = "text/template" data-template >
    <div class = "box" >
        <h3 class = "box-title" > -title- </ h3>
        <p class = "box-content" > -content- </ p>
    </ div>
</ script>
```

**CSS**


```css
* {
    box-sizing: border-box;
}

.boxes-container {
    padding: 20px;
}

.boxes-container:after {
    display: table;
    content: ' ';
    clear: both;
}

.box {
    background-color: #FFFFFF;
    height: 200px;
    width: 23%;
    float: left;
    margin: 1%;
    padding: 20px;
    color: black;
    animation: slide-up 0.4s ease;
}

@media(max-width:767px) {
    .box {
        width: 100%;
        margin-right: 0;
        margin-left: 0;
    }
}

.box-title {
    margin: 0;
    font-weight: normal;
    font-size: 30px;
}

.link-wrapper {
    text-align: center;
}

.load-more {
    display: inline-block;
    background-color: #FFFFFF;
    color: black;
    text-decoration: none;
    padding: 20px;
    transition: background 0.2s ease-in-out;
}

.load-more:hover {
    background: #8364b3;
}

@keyframes slide-up {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}
```

**Javascript**


```javascript
var $cont = $('[data-boxes-cont]');
var $btn = $('[data-more]');
var boxTemplate = $('[data-template]').html();

var fakeData = [{
    title: 'Hi!',
    content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit.'
}, {
    title: 'Hi!',
    content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit.'
}, {
    title: 'Hi!',
    content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit.'
}, {
    title: 'Hi!',
    content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, repudiandae. Vero qui necessitatibus hic iure, voluptatem consectetur suscipit magni perferendis dicta fuga nisi velit.'
}];

$btn.on('click', function(event) {
    event.preventDefault();

    var newItemsHtml = '';

    fakeData.forEach(function(item) {
        newItemsHtml += boxTemplate
            .replace(/-title-/g, item.title)
            .replace(/-content-/g, item.content)
    });

    $cont.append(newItemsHtml);
});
```

For the animation, the CSS commands that we are going to include in the React JS component is given below:


```css
@keyframes slide-up {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}
```

- In the foremost step, it is essential to ponder over the style of animation that you would like to begin with. For instance, from bottom to the top or left to right. 
- Next, decide how it is feasible to make this component reach bottom, right from its actual position. Like for instance `transform: translateY(20px);`.
- Have a glance at the present state, or rather the way it is possible to bring it back to its actual state. For instance, `transform: translateY(0);`, but if in case, you are attempting to center a particular model then it would be like, your `0%{}` state becomes `transform: translate(-50%,-48%);` as well as `100%{}`  becomes `transform: translate(-50%,-50%);`, hence, it'll be traveling around those `2%` to reach the identical level of animation.

Adding the animation takes place using `animation: slide-up 0.4s ease;`. Including the animation is how the demonstration works, and enable us to animate dynamically built elements. Whenever rendering takes place, animation gets trigged. This may happen when browser renders elements for the first time, or renders newly created elements, or when you add `display: none` to an element and then subsequently eliminate it.

## Conclusion
So we have discussed a lot of things in this guide. We set the dummy database with API functioning on a set timeout and learned how to animate a newly appended element in React. We have also learned how to include the animated elements in a dynamic webpage.
