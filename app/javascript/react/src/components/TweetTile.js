import React from 'react';
import { Link } from 'react-router';
import Review from './ReviewTile';

const TweetTile = (props) => {
  return(
    <div className="panel">
      <div className="row">
        <div className="small-3 columns">Stock</div>
        <div className="small-2 columns">Ask </div>
        <div className="small-2 columns">Daily Change (%) </div>
        <div className="small-2 columns">Market Cap </div>
        <div className="small-2 columns">Rating </div>
        <div className="small-1 columns">
          <i className="fa fa-times" onClick={props.handleDelete} aria-hidden="true"></i>
        </div>
      </div>
      <div className="row">
        <Link to={`/tweets/${props.id}`}>
          <div className="small-3 columns hover">{props.ticker}</div>
        </Link>
        <div className="small-2 columns">{props.ask}</div>
        <div className="small-2 columns">{props.percent_change}</div>
        <div className="small-2 columns">{props.market_capitalization}</div>
        <div className="small-2 columns">{props.rating}</div>
        <div className="small-1 columns"></div>
      </div>
      <div className="panel">
        <div className="row">
          <div className="small-12 columns">
            What @{props.username} is thinking...
          </div>
          <div className="small-12 columns">
            {props.body}
          </div>
        </div>
      </div>
    </div>
  );
}

export default TweetTile;
