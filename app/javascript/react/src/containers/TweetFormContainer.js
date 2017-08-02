import React from 'react';
import TextField from '../components/TextField';
import TextArea from '../components/TextArea';

class TweetFormContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ticker: '',
      body: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleClearForm = this.handleClearForm.bind(this);
  }

  handleChange(event) {
    let value = event.target.value;
    let name = event.target.name;
    this.setState({ [name]: value })
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let formPayload = {
      ticker: this.state.ticker,
      body: this.state.body
    };
    this.props.addNewTweet(formPayload);
    this.handleClearForm(event);
  }

  handleClearForm(event) {
    event.preventDefault();
    this.setState({
      ticker: '',
      body: ''
    });
  }

  render() {

    return (
        <form onSubmit={this.handleFormSubmit}>
          <TextField
            content={this.state.ticker}
            label="Ticker"
            name="ticker"
            handleChange={this.handleChange}
          />
          <TextArea
            content={this.state.body}
            label="What do you think?"
            name="body"
            handleChange={this.handleChange}
          />
          <button className="btn waves-effect waves-light blue" onClick={this.handleClearForm}>Clear</button>
          <input className="btn waves-effect waves-light blue" type="submit" name="submit" value="Submit" />
        </form>
    )
  }
}

export default TweetFormContainer;
