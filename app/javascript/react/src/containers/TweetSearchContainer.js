import React from 'react';

class TweetSearchContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      search: null
    }
    this.handleSearchChange = this.handleSearchChange.bind(this);
    this.handleSearchSubmit = this.handleSearchSubmit.bind(this);
    this.handleClearSubmit = this.handleClearSubmit.bind(this);
  }

  handleSearchChange(event) {
    let value = event.target.value;
    this.setState({ search: value })
  }

  handleSearchSubmit(event) {
    event.preventDefault();
    let formPayload = {
      search: this.state.search
    };
    this.props.handleSearch(formPayload);
    this.handleClearSubmit(event);
  }

  handleClearSubmit(event) {
    event.preventDefault();
    this.setState({ search: '' });
  }

  render() {
    return (
      <form onSubmit={this.handleSearchSubmit}>
        <div className="row">
          <div className="large-12 columns">
            <div className="row collapse">
              <div className="small-10 columns">
                <input type="text" placeholder="Ticker" value={this.state.search} onChange={this.handleSearchChange} />
              </div>
              <div className="small-2 columns">
                <input type="submit" value="Search" className="button postfix" onClick={this.handleSearchSubmit}/>
              </div>
            </div>
          </div>
        </div>
      </form>
    );
  };
}

export default TweetSearchContainer;
