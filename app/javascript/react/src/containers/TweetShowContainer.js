import React from 'react';
import Foundation from 'react-foundation';
import { Link } from 'react-router';

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
    return(
      <div>
        <h1>Hello from TweetShowContainer</h1>
      </div>
    );
  }
}

export default TweetShowContainer;
