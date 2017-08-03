import React from 'react';
import { Link } from 'react-router';

const TweetTile = (props) => {
  return(
      <div className="row" id={props.id}>
        <div className="center-align">
          <Link to={`/tweets/${props.id}`}>
            <div className="col s4">{props.ticker}</div>
          </Link>
          <div className="col s2">{props.ask}</div>
          <div className="col s2">{props.percent_change}</div>
          <div className="col s2">{props.market_capitalization}</div>
          <div className="col s2">{props.rating}</div>
        </div>
        <div className="container">
          <p>{props.body}</p>
        </div>
      </div>
  );
}

export default TweetTile;
