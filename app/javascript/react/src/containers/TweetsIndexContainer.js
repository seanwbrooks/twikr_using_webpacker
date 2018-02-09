import React from 'react';
import { Link } from 'react-router';
import TweetFormContainer from './TweetFormContainer';
import TweetSearchContainer from './TweetSearchContainer';
import TweetTileContainer from './TweetTileContainer';
import ReviewTile from '../components/ReviewTile';
import ReviewFormContainer from './ReviewFormContainer';

class TweetsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: [],
      current_user: ''
    }
    this.addNewTweet = this.addNewTweet.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
    this.deleteTweet = this.deleteTweet.bind(this);
    this.reviewSubmit = this.reviewSubmit.bind(this);
    this.deleteReview = this.deleteReview.bind(this);
  }
  componentDidMount() {
    // Working on getting devise user that signed in to React setState
    // Please see https://stories.abletech.nz/hi-im-kate-8b6420124041
    fetch('/users/sign_in')
    .then((response) => response.json())
    .then((body) => {
      this.setState({ current_user: body })
    });
    fetch('/api/v1/tweets')
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    });
  }

  handleSearch(formPayload) {
    let query = '?stock=' + encodeURIComponent(formPayload.search);
    fetch('/api/v1/tweets/search' + query, {
      credentials: 'same-origin'
    })
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

  deleteTweet(id){
    fetch(`/api/v1/tweets/${id}`, {
      method: 'DELETE',
      credentials: 'same-origin'
    })
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    })
  }

  reviewSubmit(reviewPayload){
    fetch(`/api/v1/reviews`, {
      method: 'POST',
      credentials: 'same-origin',
      body: JSON.stringify(reviewPayload)
    })
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    })
  }

  deleteReview(review){
    fetch(`/api/v1/reviews/${review.target.dataset.id}`, {
      method: 'DELETE',
      credentials: 'same-origin'
    })
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body.tweets })
    })
  }

  render() {
    let tweets = this.state.tweets.map((tweet) => {
      let reviews = tweet.reviews.map((review) => {
        return(
          <ReviewTile
            id={review.id}
            key={review.id}
            comment={review.comment}
            username={review.username}
            deleteReview={this.deleteReview}
          />
        );
      });

      return(
        <div key={tweet.id} className="panel">
          <div className="row">
            <TweetTileContainer
              id={tweet.id}
              key={tweet.id}
              username={tweet.user.username}
              ticker={tweet.ticker}
              ask={tweet.ask}
              percent_change={tweet.percent_change}
              market_capitalization={tweet.market_capitalization}
              rating={tweet.rating}
              body={tweet.body}
              date={tweet.created_at}
              deleteTweet={this.deleteTweet}
            />
          </div>
          {reviews}
          <ReviewFormContainer
            tweetId={tweet.id}
            reviewSubmit={this.reviewSubmit}
          />
        </div>
      );
    });

    return(
      <div className="body">
        <div className="row">
          <TweetSearchContainer
            handleSearch={this.handleSearch}
          />
        </div>
        <div className="row">
          <h2>What's your big idea?</h2>
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
