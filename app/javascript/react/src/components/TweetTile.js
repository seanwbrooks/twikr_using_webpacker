import React from 'react';
import { Link } from 'react-router';
import Review from '../components/ReviewTile';

const TweetTile = (props) => {

  let selectStock = (rating) => {
    if (rating == 'Growth') {
      return <i class="fa fa-arrow-up" aria-hidden="true"></i>
    } else if (rating == 'Balanced' || rating == '-') {
      return <i class="fa fa-balance-scale" aria-hidden="true"></i>
    } else {
      return <i class="fa fa-arrow-down" aria-hidden="true"></i>
    }
  }

  return(
    <div className="row">
      <div className="row">
        <div className="small-1 columns"></div>
        <div className="small-2 columns text-center"><strong>Ticker</strong></div>
        <div className="small-2 columns text-center"><strong>Ask</strong></div>
        <div className="small-2 columns text-center"><strong>Daily Change (%)</strong></div>
        <div className="small-2 columns text-center"><strong>Market Cap</strong></div>
        <div className="small-2 columns text-center"><strong>Rating</strong></div>
        <div className="small-1 columns">
          <i className="fa fa-times" onClick={props.handleDelete} aria-hidden="true"></i>
        </div>
      </div>
      <div className="row">
        <div className="small-1 columns"></div>
        <Link to={`/tweets/${props.id}`}>
          <div className="small-2 columns text-center">{props.ticker}</div>
        </Link>
        <div className="small-2 columns text-center">{props.ask}</div>
        <div className="small-2 columns text-center">{props.percent_change}</div>
        <div className="small-2 columns text-center">{props.market_capitalization}</div>
        <div className="small-2 columns text-center">{props.rating}</div>
        <div className="small-1 columns text-center"></div>
      </div>
      <div className="row">
        <div className="tweet-user">
          What <strong>@{props.username}</strong> is thinking...
        </div>
      </div>
      <div className="row">
        <div className="tweet-body">
          {props.body}
        </div>
      </div>
    </div>
  );
};

export default TweetTile;
