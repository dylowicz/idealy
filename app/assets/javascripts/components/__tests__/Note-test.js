jest.unmock("../notes/Note.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Note from '../notes/Note.es6.jsx';

describe('Note', () => {
  beforeEach(() => {
    this.component = TestUtils.renderIntoDocument(<Note />);
    this.renderedDOM = () => React.findDOMNode(this.component);
  });

  it('says hello', () => {
    let rootElement = this.renderedDOM;

    console.log(rootElement.tagName);
  });
});
