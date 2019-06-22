## Introduction
Most of the professional animators prefer to go with the React JS framework mainly because it can support enormous numbers of libraries pertaining to styles, colours and margins. But when it comes to the tabular animations then also the framework is an acclaimed choice.

In order to understand things clearly, let’s take the example of the creation of the hover button for React JS. It is one of the most convenient approaches if done in the right way. After the completion of this guide you won’t face any more problems with the hoven button creation issue.

## The Customary Coding Approach
The standard coding process that we are going to use in this regard is shown below:


```javascript
var Category = React.createClass({displayName: 'Category',
  render: function () {
      return (
        React.createElement("div", {className: "row"}, 
        React.createElement("button", null, "Search",   {OnMouseEnter: To be learned})
      )
    );
  }
});

React.render(React.createElement(Category), contain);
```

Here, it is essential to understand that for the creation of the new button in a whole, one can bring the change to the style/label of the button as shown in the code below:


```javascript
var HoverButton = React.createClass({
    getInitialState: function () {
        return {hover: false};
    },

    mouseOver: function () {
        this.setState({hover: true});
    },

    mouseOut: function () {
        this.setState({hover: false});
    },

    render: function() {
        var label = "foo";
        if (this.state.hover) {
            label = "bar";
        }
        return React.createElement(
            "button",
            {onMouseOver: this.mouseOver, onMouseOut: this.mouseOut},
            label
        );
    }
});

React.render(React.createElement(HoverButton, null), document.body);
```

Now, after going through this command some of you would suggest that it is better to implement CSS in order to handle the matter. But as our priority is to go with the React JS then it is simply recommended to set the flag in the `true` state while entering the command for the `onMouseEnter`. After the completion of this step, all you are required to do is set the same flag into the `false` command in the `onMouseLeave`. So, no fancy approach is required and solution can be attained on straightforward basis.

## The Addition of Hover Events in React Component
It is not only the button tags that require hover events. There are certain other events that require the hover events to make things effective and compelling. The following are certain ways by which it can be achieved.

### The Styled-Components
I would certainly recommend the application of the styled components as it is arguably one of the key libraries available out there that applies style HTML. Just have a glance over the following commands and you are going to understand the application and its worth.


```
yarn add styled-components
npm install styled-components
```


```javascript
import styled from 'styled-components';

const HoverText = styled.p`
	color: #000;
	:hover {
		color: #ed1212;
		cursor: pointer;
	}
```

In addition to that, in the class when its time to use your `p` tag you want to replace it with our `HoverText` component. So, rather than


```javascript
<p > Test </ p>
```

It is recommended that you use the following command in order to avail the right results:


```javascript
<HoverText > Test </ HoverText>
```

It is quite simple and convenient! Don’t you think?  

### The Javascript Program Handlers
If you are going with a basic case, then it is advisable that you don’t go with the next approach. The concerned approach that we are going to discuss right here is especially meant for the scenarios that are complicated in nature.


```javascript
constructor(props) {
	super(props)
	this.state = {
		hover: false
	}
}

toggleHover() {
	this.setState({hover: !this.state.hover})
}

render {
   var linkStyle;
   if (this.state.hover) {
     linkStyle = {color: '#ed1212',cursor: 'pointer'}
   } else {
     linkStyle = {color: '#000'}
   }
	return(
		<p style={linkStyle} onMouseEnter={this.toggleHover} onMouseLeave={this.toggleHover}>Test</p>
	)
}
```

Now, in the code given below, you are going to find that the CSS approach is quite identical to that of the styled-components. Within the CSS file concerned with your work, the set up would look like the following: 


```css
p {
	color: #000;
	:hover {
		color: #ed1212;
		cursor: pointer;
	}
}
```

## Conclusion
So, the next time when you are planning about the creation of the hover button for React JS then you are going to find that the approach that you have followed via this guide has made things much easier for you. The commands used here are prolific with the style components as well as render results in the CSS setup. The commands are well tested and rendered positive results even when the variables have been changed to the extreme level.

## References
While writing this guide, the following resources have been referred to:
- [A Hover Button in React JS, Retrieved on June 22, 2019](https://stackoverflow.com/questions/28072196/a-hover-button-in-react-js)
- [Edward Beazer, How to Add Hover Events to Any React Component, Retrieved on June 22, 2019](https://www.edwardbeazer.com/how-to-add-hover-events-to-any-react-component/)
