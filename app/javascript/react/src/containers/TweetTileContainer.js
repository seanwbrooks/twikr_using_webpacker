import React from 'react';
import { Link } from 'react-router';
import Review from '../components/ReviewTile';

class TweetTileContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rating: null,
      id: null,
      comment: "",
      hideDelete: "hide"
    }
    this.deleteTweet = this.deleteTweet.bind(this);
  };

  componentDidMount() {
    if (this.props.rating === 'High' || this.props.rating === 'Buy') {
      this.setState({ rating: "fa fa-arrow-up green" });
    } else if (this.props.rating === 'Balanced' || this.props.rating === '-') {
      this.setState({ rating: "fa fa-minus" });
    } else {
      this.setState({ rating: "fa fa-arrow-down red"});
    };
    this.setState({ id: this.props.id })
    // Give user ability to delete if she is current user
    if (this.props.current_username == this.props.username) {
      this.setState({ hideDelete: "" });
    }
  };

  deleteTweet() {
    this.props.deleteTweet(this.state.id);
  }

  render() {
    return(
      <div className="row">
        <div className="row">
          <div className="small-1 columns"></div>
          <div className="small-10 columns tweet-name">
            <strong>@{this.props.username}</strong>
          </div>
          <div className="small-1 columns">
            <i className={"fa fa-times" + this.state.hideDelete} onClick={this.deleteTweet} aria-hidden="true"></i>
          </div>
        </div>
        <div className="row">
          <div className="small-1 columns"></div>
          <div className="small-2 columns text-center"><strong>Ticker</strong></div>
          <div className="small-2 columns text-center"><strong>Ask</strong></div>
          <div className="small-2 columns text-center"><strong>Daily Change (%)</strong></div>
          <div className="small-2 columns text-center"><strong>Market Cap</strong></div>
          <div className="small-2 columns text-center"><strong>Growth Indicator</strong></div>
          <div className="small-1 columns text-center"></div>
        </div>
        <div className="row">
          <div className="small-1 columns"></div>
          <div className="small-2 columns text-center">{this.props.ticker}</div>
          <div className="small-2 columns text-center">{this.props.ask}</div>
          <div className="small-2 columns text-center">{this.props.percent_change}</div>
          <div className="small-2 columns text-center">{this.props.market_capitalization}</div>
          <div className="small-2 columns text-center"><i className={this.state.rating} aria-hidden="true"></i></div>
          <div className="small-1 columns text-center"></div>
        </div>
        <div className="row">
          <div className="tweet-body">
            {this.props.body}
          </div>
        </div>
      </div>
    );
  }
};

export default TweetTileContainer;
