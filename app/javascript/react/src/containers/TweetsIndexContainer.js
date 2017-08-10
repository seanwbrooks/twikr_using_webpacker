import React from 'react';
import { Link } from 'react-router';
import TweetFormContainer from './TweetFormContainer';
import TweetSearchContainer from './TweetSearchContainer';
import TweetTile from '../components/TweetTile';
import ReviewTile from '../components/ReviewTile';

class TweetsIndexContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tweets: [],
      comment: ""
    }
    this.addNewTweet = this.addNewTweet.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }

  componentDidMount() {
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

  handleDelete(){
    fetch('/api/v1/tweets/${id}', {
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
          <div className="row">
            <ReviewTile
              id={review.id}
              key={review.id}
              comment={review.comment}
            />
          </div>
        );
      });

      return(
        <div key={tweet.id} className="panel">
          <div className="row">
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
                handleDelete={this.handleDelete}
              />
            </div>
            <div className="reviews">
              <div className="row">
                {reviews}
              </div>
            </div>
          </div>
          <div className="row">
            <form className="comment-form" onSubmit={this.handleCommentSubmit}>
              <div className="row">
                <div className="large-12 columns">
                  <div className="row collapse">
                    <div className="small-11 columns">
                      <input type="text" content={this.state.search} onChange={this.handleSearchChange} placeholder="Comment" />
                    </div>
                    <div className="small-1 columns">
                      <input type="submit" value="POST" className="button postfix" onClick={this.handleSearchSubmit}/>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
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
