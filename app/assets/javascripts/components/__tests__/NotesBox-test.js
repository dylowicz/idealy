jest.unmock("../NotesBox.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NotesBox from '../NotesBox.es6.jsx';

describe('NotesBox', () => {
  it('says hello', () => {
    console.log("Hello my first test!");
  });
});
