import React from 'react';
import { Link } from 'react-router';
import ReviewTile from '../components/ReviewTile';

class TweetShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
  }

  componentDidMount() {
    let tweetId = this.props.params.id;
    fetch(`/api/v1/tweets/${tweetId}/reviews`)
    .then((response) => response.json())
    .then((body) => {
      this.setState({ reviews: body.reviews })
    });
  }

  render() {
    debugger;
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
        <div className="row">
          {reviews}
        </div>
      </div>
    );
  }
}

export default TweetShowContainer;
