import React from 'react';
import { Link } from 'react-router';

const TweetTile = (props) => {
  return(
      <div className="row" id={props.id}>
        <div className="row">
          <p>@{props.username}</p>
        </div>
        <div className="row">
          <div className="col s4">{props.ticker}</div>
          <div className="col s2">{props.ask}</div>
          <div className="col s2">{props.percent_change}</div>
          <div className="col s2">{props.market_capitalization}</div>
          <div className="col s2">{props.rating}</div>
        </div>
        <div className="row">
          <div>{props.body}</div>
        </div>
      </div>
  );
}

export default TweetTile;
