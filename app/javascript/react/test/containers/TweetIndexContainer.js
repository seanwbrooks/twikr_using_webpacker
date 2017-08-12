import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import TweetsIndexContainer from '../../src/containers/TweetsIndexContainer';
import TweetSearchContainer from '../../src/containers/TweetSearchContainer';
import TweetFormContainer from '../../src/containers/TweetFormContainer';
import TweetTileContainer from '../../src/containers/TweetTileContainer';

describe('TweetsIndexContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<TweetsIndexContainer />);
  });

  //can't find variable fetch (look into promise polyfill)
  xit('should have the specified initial state', () => {
    expect(wrapper.state().toEqual({ tweets: [] }));
  });

  xit('should render a TweetSearchContainer', () => {
    expect(wrapper.find(TweetSearchContainer).toBePresent());
  });

  xit('should render a TweetFormContainer', () => {
    expect(wrapper.find(TweetFormContainer).toBePresent());
  });

  xit('should render a TweetTileContainer', () => {
    expect(wrapper.find(TweetTileContainer).toBePresent());
  });
});
