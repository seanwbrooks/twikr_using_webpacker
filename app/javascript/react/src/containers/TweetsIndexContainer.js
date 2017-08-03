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
  }

  addNewTweet(formPayload){
    fetch('/tweets', {
      method: 'POST',
      body: JSON.stringify(formPayload)
    })
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: [...this.state.tweets, body ]})
    })
  }

  render() {
    let tweets = this.state.tweets.map((tweet) => {
      return(
        <div className="container z-depth-3 hoverable">
          <TweetTile
            id={tweet.id}
            key={tweet.id}
            ticker={tweet.ticker}
            ask={tweet.ask}
            percent_change={tweet.percent_change}
            market_capitalization={tweet.market_capitalization}
            rating={tweet.rating}
            body={tweet.body}
          />
        </div>
      )
    });

    return(
      <div>
        <div className="container">
          <TweetFormContainer
            addNewTweet={this.addNewTweet}
          />
        </div>
        {tweets}
      </div>
    );
  }
}

export default TweetsIndexContainer;
