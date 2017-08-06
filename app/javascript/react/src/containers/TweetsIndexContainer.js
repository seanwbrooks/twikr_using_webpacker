import React from 'react';
import { Link } from 'react-router';
import TweetFormContainer from './TweetFormContainer';
import TweetTile from '../components/TweetTile';

class TweetsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: []
    }
    this.addNewTweet = this.addNewTweet.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/tweets')
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    });
    $(function(){ $(document).foundation(); })
  }

  addNewTweet(formPayload){
    fetch('/api/v1/tweets', {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    })
    .then((response) => response.json())
    .then((body) => {
      debugger;
      this.setState({ tweets: [...this.state.tweets, body.tweet ]})
    })
  }

  render() {
    let tweets = this.state.tweets.map((tweet) => {
      return(
        <div className="row">
          <TweetTile
            id={tweet.id}
            key={tweet.id}
            username={tweet.user.username}
            ticker={tweet.ticker}
            ask={tweet.ask}
            percent_change={tweet.percent_change}
            market_capitalization={tweet.market_capitalization}
            rating={tweet.rating}
            body={tweet.body}
            reviews={tweet.reviews}
          />
        </div>
      );
    });

    return(
      <div>
        <div className="row">
          <h1>Share an investment</h1>
          <TweetFormContainer
            addNewTweet={this.addNewTweet}
          />
        </div>
        <div className="row">
          <h1>Fresh Ideas</h1>
          {tweets}
        </div>
      </div>
    );
  }
}

export default TweetsIndexContainer;
