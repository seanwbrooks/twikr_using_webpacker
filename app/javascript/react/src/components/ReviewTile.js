import React from 'react';

const ReviewTile = (props) => {
  return(
    <div className="row">
      <div className="small-12 columns">{props.username}</div>
      <div className="small-12 columns">{props.comment}</div>
    </div>
  );
}

export default ReviewTile;
