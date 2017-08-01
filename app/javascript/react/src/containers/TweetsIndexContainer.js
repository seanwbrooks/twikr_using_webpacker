import React,{ Component } from 'react';
import { Link } from 'react-router';

class TweetsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: []
    }
  }

  componentDidMount() {
    fetch('/api/v1/tweets')
    .then((response) => response.json())
    .then((body) => {
      this.setState({ tweets: body })
    });
  }

  render() {
    return(
      <div>
        <h1>Hello from TweetsIndexContainer</h1>
      </div>
    );
  }
}

export default TweetsIndexContainer;
