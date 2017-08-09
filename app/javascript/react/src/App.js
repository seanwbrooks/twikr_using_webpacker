import React from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import TweetsIndexContainer from './containers/TweetsIndexContainer';
import TweetShowContainer from './containers/TweetShowContainer';

const App = props => {
  return(
    <div>
      <Router history={browserHistory}>
        <Route path='/' component={ TweetsIndexContainer } />
        <Route path='/tweets' component={ TweetsIndexContainer } />
        <Route path='/tweets/:id' component={ TweetShowContainer } />
      </Router>
    </div>
  );
}

export default App;
