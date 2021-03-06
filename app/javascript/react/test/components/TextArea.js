import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

import TextArea from '../../src/components/TextArea';

describe('TextArea', () => {
  let name, content, wrapper;

  beforeEach(() => {
    wrapper = mount(
      <TextArea
        name="Input"
        content="This is the contents of the textarea."
      />
    );
  });

  it('should render an div tag', () => {
    expect(wrapper.find('div').length).toEqual(1);
  });

  it('should render an div tag with text', () => {
    expect(wrapper.find('div').text()).toBe(">This is the contents of the textarea.");
  });
})
