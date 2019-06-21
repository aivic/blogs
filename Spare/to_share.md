## Introduction 
Learning the right approach of styling in the React JSX is a key area for every professional animator right from the budding to the veteran level. The veteran animators is included down here due to the fact that the concepts of style animation are dynamic and there is no full stop to learning.

After the completion of this guide, you will learn the right approach of creating and applying the most dependable React JSX Style tag in no time.  

## Style Tag Component Creation with Webpack
In my personal opinion, I hate including libraries in the React application.

No, it is not like I have any sort of grudge with the libraries or the React component itself, it is just that when you are writing in React then it is always a daunting task to make a decision which style library to add and which one to skip. You can simply opt for CSS Javascript and then put on the media queries. If you prefer to use Webpack in order to track the events of the future, then it is always a preferable option to go with the CSS loader and attach all your created components to Webpack. Or rather you prefer to directly bypass the problem then you can simply accumulate all the components together and run them with Syntactically Awesome Style Sheets (SASS). Hence, you can see that there are various ways in which things can be done and their cost of application depends on the situation as well as from one person to another. This is the reason why I mentioned that I seldom go with the libraries and in this guide also we are going to follow the same approach. 

One of the approaches of opting out is certainly with style tag in React JSX which is shown below:

**`<style>` + dangerouslySetInnerHTML **


```javascript
const MyStyledComponent = props =>
  <div className = "styled">
    Hover for color change
    <style dangerouslySetInnerHTML = {{__html: `
      .styled { color: blue }
    `}} />
  </ div>
```

So, in the standard professional terms, the commands mentioned above doesn't look like a refined one. But if we simply overlook the obnoxious appearance of the commands for once and look at the other side of the coin, then what are the advantages that we can actually attain? 
- It co-opts the style definition with all my ascertained components.
- It is simple, conventional CSS with no builds and no libraries at all. 
- It is functioning on the media queries and once again there are no builds and no libraries at all. 
- As a bonus, there are Javascript variables that one can acquire in this process. 

## What Can Be Done With Existing Solution? 
Having brainstormed various answers for this question and the most prudent answer that we came up with is "**we can do everything**". It is the CSS + the JavaScript that we are talking about.

It is almost perfect in every sense and the only setback you get while working on it is the inline-styles admission to the media queries. Now, this setback is not such that it cannot be rectified. In order to rectify the same, we are using the following commands:


```javascript
<style dangerouslySetInnerHTML={{__html: `
  @media (max-width: 600px) {
    .styled { color: fuchsia; }
  }
`}}>
```

While considering the layout components, it is arguably the finest bet! 

## Caveats
**`<style>` tags are universal**
While the the styles are located in a module, all these tags are global. So name classes with caution.

**No code completion or highlighting feature**
Without the presence of an exceptional editor, it is a high risk gamble to apply CSS in a JavaScript. While working with a JS object, the CSS is calculated as expression and dispatched as attribute into JSX tag. Now, it is a problem which we can't deal. 

**No type auto-prefixing**
All your prefixes are required to be hand-rolled. This makes the work more intense for the developer. Prefixes are an essential component for flexbox. Here, you are required to set flexbox elements along with prefixes to be defined inline. 

## Conclusion 
The formation and the application of the React JSX style tag can be done without involving libraries at all. It is practically possible as we have learned in this guide. Right from the basic HTML to CSS + JavaScript proper bifurcation of the boundaries, colour and the background can be done easily.

## Reference
While writing this guide, the following resource has been referred to:
- [Michael Chan, The `<style>` tag and React, Retrieved on June 21, 2019](https://medium.learnreact.com/the-style-tag-and-react-24d6dd3ca974)
