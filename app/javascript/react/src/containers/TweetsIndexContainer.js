import React from 'react';
import { Link } from 'react-router';
import TweetFormContainer from './TweetFormContainer';
import TweetTile from '../components/TweetTile';

class TweetsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: [],
      search: ''
    }
    this.addNewTweet = this.addNewTweet.bind(this);
    this.handleSearchSubmit = this.handleSearchSubmit.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }

  componentDidMount() {
    fetch('/api/v1/tweets')
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    });
  }

  handleSearchSubmit() {
    fetch('/api/v1/tweets'), {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(this.state.search)
    }
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    });
  }

  addNewTweet(formPayload){
    fetch('/api/v1/tweets', {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(formPayload)
    })
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    });
  }

  handleDelete(){
    fetch('/api/v1/tweets', {
      method: 'DELETE',
      credentials: 'same-origin'
    })
    .then((response) => response.json())
    .then((body) => {
      alert("Post was successfully deleted.")
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
            handleDelete={this.handleDelete}
          />
        </div>
      );
    });

    return(
      <div className="body">
        <div className="row">
          <form onSubmit={this.handleSearchSubmit}>
            <div className="row">
              <div className="large-12 columns">
                <div className="row collapse">
                  <div className="small-10 columns">
                    <input type="text" placeholder="Ticker Search" value={this.state.search} />
                  </div>
                  <div className="small-2 columns">
                    <input type="submit" className="button postfix" />
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div className="row">
          <h1>What's your big idea?</h1>
          <TweetFormContainer
            addNewTweet={this.addNewTweet}
          />
        </div>
        <div className="row">
          {tweets}
        </div>
      </div>
    );
  }
}

export default TweetsIndexContainer;
