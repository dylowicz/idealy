jest.unmock("../notes/Note.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Note from '../notes/Note.es6.jsx';

describe('Note', () => {
  beforeEach(() => {
    let note = {
      content: "There is some content",
      created_at: "2016-06-08T00:27:00.490Z"
    };

    let component = TestUtils.renderIntoDocument(<Note content={note.content} created_at={note.created_at} />);
    let renderedDOM = () => React.findDOMNode(component);
  });

  it('says hello', () => {
    // let rootElement = this.renderedDOM;

    // console.log(rootElement.tagName);
  });
});
