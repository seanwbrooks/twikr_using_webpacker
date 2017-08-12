import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import TextField from '../../src/components/TextField';

describe('TextField', () => {
  let name, value, content, wrapper;

  beforeEach(() => {
    wrapper = mount(
      <TextField
        name="Input"
        content="TSLA"
        value="This is the contents of the textfield."
      />
    );
  });

  it('should render an div tag', () => {
    expect(wrapper.find('div').length).toEqual(1);
  });

  it('should render an div tag with text', () => {
    expect(wrapper.find('div').text()).toBe('>');
  });
})
