import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="row">
      <div className="small-12 columns">{props.comment}</div>
    </div>
  );
}

export default ReviewTile;
