import React from 'react';
import { Link } from 'react-router';
import Review from './ReviewTile';

const TweetTile = (props) => {
  // let reviews = props.reviews.map((review) => {
  //   return(
  //     <ReviewTile
  //       id={review.id}
  //       key={review.id}
  //       comment={review.comment}
  //     />
  //   );
  // });

  return(
    <div className="panel">
      <div className="row">
        <Link to={`/tweets/${props.id}`}>
          <div className="small-4 columns">{props.ticker}</div>
        </Link>
        <div className="small-2 columns">Ask: {props.ask}</div>
        <div className="small-2 columns">Daily Change: {props.percent_change}</div>
        <div className="small-2 columns">Market Cap: {props.market_capitalization}</div>
        <div className="small-2 columns">Rating: {props.rating}</div>
        <i className="fa fa-times" aria-hidden="true"></i>
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
      {/* <div className="row">
        <div>{reviews}</div>
      </div> */}
    </div>
  );
}

export default TweetTile;
