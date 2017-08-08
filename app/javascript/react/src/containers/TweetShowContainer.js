import React from 'react';
import { Link } from 'react-router';
import ReviewTile from '../components/ReviewTile';

class TweetShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: {},
      reviews: []
    }
  }

  componentDidMount() {
    let tweetId = this.props.params.id;
    fetch(`/api/v1/tweets/${tweetId}`)
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweet: body.tweet, reviews: body.tweet.reviews })
    });
  }

  render() {
    let reviews = this.state.reviews.map((review) => {
      return(
        <ReviewTile
          id={review.id}
          key={review.id}
          comment={review.comment}
        />
      );
    });

    return(
      <div className="row">
        <h1>{this.state.tweet.ticker}</h1>
        <div className="row">
          {reviews}
        </div>
      </div>
    );
  }
}

export default TweetShowContainer;
