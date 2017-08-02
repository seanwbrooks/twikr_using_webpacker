import React from 'react';
import { Link } from 'react-router';

const TweetTile = (props) => {
  return(
    <Link to={`/tweets/${props.id}`}>
      <div className="row">
        <h3>{props.symbol}</h3>
        <h3>{props.ask}</h3>
        <h3>{props.percent_change}</h3>
        <h3>{props.market_capitalization}</h3>
        <h3>{props.rating}</h3>
      </div>
      <div className="row">
        <p>{props.body}</p>
      </div>
    </Link>
  );
}

export default TweetTile;
