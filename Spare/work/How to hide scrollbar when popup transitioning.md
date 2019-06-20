## Introduction
In the world of animation, the possibilities are limitless. There is a solution to every kind of challenge, all you required is to explore wisely. In animation, there is a significance of even the minute things that doesn't seem relevant at the first glance. But when you make changes in the same then you are going to find that the end product has turned out to be even better than the standard outputs. 

Here, in this guide our purpose is to explore the changes taking place in one such component which doesn't seem to be that significant in the standard terms but can change the game if you seek to take the animation to the next level. Here, we are going to throw some light on the process of hiding the scrollbar when the popup transitioning is taking place. 

Now you may ask; what is the actual significance of hiding the scrollbar when the popup animation is already being displayed upon the screen? Here, it is all about the compatibility of the elements being displayed on the screen and how refined the whole page would look like when all the supporting components are concealed. So here, we are going to learn how to hide the scroll bar while successfully scrolling through the screen with the help of CSS.

## Effective Scrollbar Concealing with Webkit 
In order to conceal the scrollbar apply `-webkit-` due to the reason that it is quite effective to the key browsers available out there including Google Chrome, Opera and Safari. When you are looking around for the options accessible on other browsers, there are certain answers that can help you on the way. Some of them are highlighted below for your convenience.

-  -webkit- (Chrome, Opera and Safari):
`.element:-webkit-scrollbar { width: 0 !important }`
- -moz- (Firefox):
`.element { overflow: -moz-scrollbars-none; }`
- -ms- (IE +10):
`.element { -ms-overflow-style: none; }`

Factors to take into account before hiding Scroll bar:

- It is advisable to conceal the scrollbars only by the case when all available content is actually visible otherwise you may actually overlook the content.
- It is recommended to shun horizontal scrolling over the web pages as well as not to conceal the horizontal scroll bar as they might result in making the reception of the content a challenging task. 
- If after taking all the measures, hiding scroll is necessary then it is suggestive to publish all the vital information over the fold. You may frequently decide whether you wish to stay or rather not on the content which you can observe in absence of scrolling.

The people who are aware of the functioning of the social media (as most of us are!) can easily observe a realistic example of concealing the scroll bar on the chat window available on social media like Facebook. That is one of the genuine common examples of the topic that we are shedding light upon in this guide. 

Have a look at the example down below on how the commands are implemented in order to hide the scrolling function and see the transition over the screen as a whole:


```html
<!DOCTYPE html> 
<html > 
    <head > 
        <style > 
            .content, .outer-border { 
                width: 240px; 
                height: 150px; 
                text-align:justify; 
                background-color:green; 
                color:white; 
                padding-left:10px; 
                padding-right:10px; 
            } 
            .outer-border { 
                border: 2px solid black; 
                position: relative; 
                overflow: hidden; 
            } 
            .inner-border { 
                position: absolute; 
                left: 0; 
                overflow-x: hidden; 
                overflow-y: scroll; 
            } 
            .inner-border::-webkit-scrollbar { 
                display: none; 
            } 
        </ style> 
    </ head> 
    <body > 
        <div class = "outer-border" > 
            <div class = "inner-border" > 
                <div class = "content" > 
					At Pluralsight, we believe everyone should have the opportunity to create progress through technology and develop the skills of tomorrow. With assessments, learning paths and courses authored by industry experts, our platform helps businesses and individuals benchmark expertise across roles, speed up release cycles and build reliable, secure products.
                </ div> 
            </ div> 
        </ div> 
    </ body> 
</ html>      
```

![Imgur](https://i.imgur.com/cN3pMHN.png)

## Hiding Horizontal Scroll Bar During the Transition 
Now let us take the following example of the commands displayed in the code block below. It is a situation that you usually faces while doing the changes in the scroll animation. Just go through the commands of the animation shown below and see what results you acquire and how you can bring change in the same by hiding the scroll bar.


```css
/* Animations */
.slide-animation.ng-enter, .slide-animation.ng-leave  {
  -webkit-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
  -moz-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
  -o-transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
  transition:all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;

  position:absolute;
}

.slide-animation.ng-enter {
  opacity:0;
  left:300px;
  overflow-y: hidden;
  overflow-x:hidden;
}

.slide-animation.ng-enter.ng-enter-active {
  opacity:1;
  left: 0;
  top: 0;
}

.slide-animation.ng-leave {
  opacity:0;
  left: 0;
  top: 0;
}

.slide-animation.ng-leave.ng-leave-active {
  opacity:0;
  left: 0;
  top: 0;
}
```

Now, in the above displayed code, when you notice it closely, then you find everything seems to be working perfectly fine except for the fact that the scrollbar is present at the time when the content is entered. It simply moves from right end to the left hand side when the codes are entered. 

Now, as per your opinion, what can be actually be done in order to conceal this scrollbar at the time of doing the animation? 

Here, there are certain measures that you can take and avail flawless results. Simply set `overflow: hidden` to the body React CSS. Here, it is critical to note that including this is going to conceal all the overflown contents comprising of the vertical type scroll bar. Additionally, you would not wish to attain that since the entire page contents present over there be concealed under the circumstances where the height is being overflown. Therefore, if you are applying a slide transition and only wish to conceal horizontal scrolling bar present during the transition, then it's recommended to rather go with the following:


```css
body {
    overflow-x:hidden;  
}
```

## Conclusion
As we have discussed above, the role of webkit is crucial and there are certain factors to be familiar with before hiding the scrollbar. We learned how with slight improvisation a simultaneous working of horizontal and vertical scrolling can be achieved. With the help of this small rectification measure, you can successfully conceal the horizontal scrolling bar without impacting the vertical scrolling bar either one way or the other. Go with it and avail better results with popup transitioning. 

## References
While writing this guide, the following resources have been referred:
- [Hide Scroll Bar, While Still Being Able to Scroll using CSS, Referred on June 19, 2019](https://www.geeksforgeeks.org/hide-scroll-bar-but-while-still-being-able-to-scroll-using-css/)
- [Scrollbar Appears through CSS Animation/Transition, Referred on June 19, 2019](https://stackoverflow.com/questions/20973870/scrollbar-appears-through-css-animation-transition)
