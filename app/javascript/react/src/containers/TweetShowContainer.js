import React from 'react';
import { Link } from 'react-router';

class TweetShowContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweet: {}
    }
  }

  componentDidMount() {
    let tweetId = this.props.tweetId;
    fetch(`/api/v1/tweets${tweetId}`)
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweet: body })
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
