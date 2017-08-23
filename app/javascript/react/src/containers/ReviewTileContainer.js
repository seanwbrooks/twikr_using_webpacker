import React from 'react';

class ReviewTileContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comment: ""
    }
  }

  render() {
    return(
      <div className="row">
        <div className="small-12 columns">{props.comment}</div>
      </div>
    );
  }
}

export default ReviewTileContainer;
