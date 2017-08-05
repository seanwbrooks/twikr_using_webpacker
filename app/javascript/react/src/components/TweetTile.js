import React from 'react';
import Foundation from 'react-foundation';
import { Link } from 'react-router';

const TweetTile = (props) => {
  return(
    <div className="callout secondary">
      <div className="row">
        <h3>@{props.username}</h3>
      </div>
      <div className="row">
        <Link to={`/tweets/${props.id}`}>
          <div className="small-4 columns">{props.ticker}</div>
        </Link>
        <div className="columns">{props.ask}</div>
        <div className="columns">{props.percent_change}</div>
        <div className="columns">{props.market_capitalization}</div>
        <div className="columns">{props.rating}</div>
      </div>
      <div className="row">
        <div>{props.body}</div>
      </div>
    </div>
  );
}

export default TweetTile;
