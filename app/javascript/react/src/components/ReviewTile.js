import React from 'react';

const ReviewTile = (props) => {
  return(
    <div className="review-panel">
      <div className="row">
        <div className="small-4 columns">@{props.username}</div>
        <div className="small-7 columns"></div>
        <div className="small-1 columns review-close">
          <i className={"fa fa-times " + props.hideDelete} data-id={props.id} onClick={props.deleteReview} aria-hidden="true"></i>
        </div>
      </div>
      <div className="row review">
        <div className="small-12 columns">{props.comment}</div>
      </div>
    </div>
  );
}

export default ReviewTile;
