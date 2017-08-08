import React from 'react';
import { Link } from 'react-router';

const ReviewTile = (props) => {
  return(
    <div className="callout secondary">
      <div className="row">
        <div>{props.comment}</div>
      </div>
    </div>
  );
}

export default ReviewTile;
