## Introduction 
The scrolling is one of the styles that demand skillful animation yet challenges you with the features that you can always experiment with. In the React JS component, there is always scope to experiment with the scrolling tables. 

In this guide, our objective is to learn the process of making the scrolling tables not only with the application of React JS but also with Skeleton CSS.  After going through this guide, it is fully assured that even with the knowledge of the basic animation, it would be feasible for you to create the scrolling tables in the most effective manner and avail productive results out of it. It is an obvious fact that when it is about the creation of the tables in the React JS component then one can bring several changes to the style and capacity of the tables via animation.

## The Exact Application in React
In React, the components are extracted from the history container and the height and the overflow is adjusted according to the capacity of the table. Just have a glance at the code below:

**Historycontainer.js**


```javascript
import React from 'react'; 

import HistoryItem from './historyItem';

export default class HistoryContainer extends React.Component {
	render(){
    	var self=this;
        	return (
                  <div >
                      <h6 > <strong > {'Service History'} </ strong> </ h6>
                      <table >
                      <tbody styles = {'height: 100px; overflow: scroll;'} >
                      {
                        self.props.historyItems.map(function(historyItem) 
                        {
                          return ( 
                                  <HistoryItem  historyItem = {historyItem} />
                                )
                        })
                      }
                      </ tbody>
                      </ table>
                  </ div>
			);
		} }
```

When you are importing history item in the JavaScript application then there are certain new addition and deletion before the final application. Observe the commands shown below, especially the exporting of the default class HistoryItem and then extending the React Component. 

**HistoryItem.jsx**


```javascript
import React from 'react';

export default class HistoryItem extends React.Component{

  convertDate(data)
  {
     var d= new Date(data);
     return (d.getMonth()+1)+'\\'+d.getDate()+"\\"+ d.getFullYear();
  }
  render(){

       if(this.props.historyItem.WorkPerformedSummary==='')
       {
        return null;
       }

       return( 
          <div className = 'row' >
                <tr >
                      <td > <strong > {this.props.historyItem.WorkPerformedSummary}</ strong> </ td>

                      { this.props.historyItem.CompletedDate ? <td >
                                  {this.convertDate(this.props.historyItem.CompletedDate)}
                                  </ td>: <td > {'n/a'} </ td>  }
                </ tr>
          </ div>
          );
  }
}
```

So, the command mentioned above is one of the situation where you normally face the issue(s) that we have discussed earlier. Here, in this programming phase, you normally face the issue of not getting the table within the `HistoryContainer.jsx` in order to get a scrollbar. 

Therefore, the first thought which comes to our mind is, is it because in the absence of styling in `<tbody>` that the scrolling is not taking place? Let's figure it out!

## Working On the Solution
The solution is pretty interesting! All you are required to do is convert the `<tbody>` into block level components to ensure that they are scrollable.

It is advisable that you try by adding the following code to `<tbody>` and `<thead>`. 

```
display: block;
```

It is essential that you make the required changes in the code in advance to include `<thead>` and make it work. The browser compatibility is also one of the critical factors that you need to take into account.

The final change that has been bought in the code is shown below:


```javascript
 <tbody style={{'height': '300px', 'overflow':'scroll', 'display': 'block'}}>
```

## Conclusion
In this guide, you have learned how to make scrolling tables using React JS and Skeleton CSS by learning the proper usage of `display:block`.

## Reference
While writing this guide, the following resource has been referred to:
- [Scrolling tables using ReactJS and Skeleton CSS, Retrieved on June 21, 2019](https://stackoverflow.com/questions/30986991/scrolling-tables-using-reactjs-and-skeleton-css)
