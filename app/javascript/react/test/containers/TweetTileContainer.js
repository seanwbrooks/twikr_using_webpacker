import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import TweetTileContainer from '../../src/containers/TweetTileContainer';

describe('TweetTileContainer', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<TweetTileContainer />);
  });

  xit('should have the specified initial state', () => {
    wrapper.setState({ rating: null, id: null, comment: "" });

    expect(wrapper.state().toEqual({ rating: null }));
    expect(wrapper.state().toEqual({ id: null }));
    expect(wrapper.state().toEqual({ comment: "" }));
  });
});
