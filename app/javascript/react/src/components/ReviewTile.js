import React from 'react';

const ReviewTile = (props) => {
  return(
    <div className="review-panel">
      <div className="row">
        <div className="small-12 columns">@{props.username}</div>
      </div>
      <div className="row review">
        <div className="small-12 columns">{props.comment}</div>
      </div>
    </div>
  );
}

export default ReviewTile;
