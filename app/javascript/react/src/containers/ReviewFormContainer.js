import React from 'react';

class ReviewFormContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comment: ""
    };
    this.handleReviewSubmit = this.handleReviewSubmit.bind(this);
    this.handleReviewChange = this.handleReviewChange.bind(this);
    this.handleReviewClear = this.handleReviewClear.bind(this);
  }

  handleReviewSubmit(event){
    event.preventDefault();
    let reviewPayload = {
      tweet_id: this.props.tweetId,
      comment: this.state.comment
    };

    this.props.reviewSubmit(reviewPayload);
    this.handleReviewClear(event);
  }

  handleReviewChange(event){
    let value = event.target.value;
    this.setState({ comment: value })
  }

  handleReviewClear(event){
    event.preventDefault();
    this.setState({ comment: "" });
  }

  render() {
    return(
      <form className="comment-form" onSubmit={this.handleReviewSubmit}>
        <div className="row collapse">
          <div className="small-11 columns">
            <input type="text" placeholder="Write a comment..." value={this.state.comment} onChange={this.handleReviewChange} />
          </div>
          <div className="small-1 columns">
            <input type="submit" value="Post" className="button postfix" onClick={this.handleReviewSubmit}/>
          </div>
        </div>
      </form>
    );
  };
};

export default ReviewFormContainer;
