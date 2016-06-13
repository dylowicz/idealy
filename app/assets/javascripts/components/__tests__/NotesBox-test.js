jest.unmock("../notes/NotesBox.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NotesBox from '../notes/NotesBox.es6.jsx';

describe('NotesBox', () => {
  it('says hello', () => {
    console.log("Hello my first test!");
  });
});
