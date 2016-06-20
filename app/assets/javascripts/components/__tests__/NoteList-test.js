jest.unmock("../notes/NoteList.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NoteList from '../notes/NoteList.es6.jsx';

describe('NoteList', () => {
  it('says hello', () => {

    let renderer = TestUtils.createRenderer();

    // const noteList = renderer.render(
    //   <NoteList/>
    // );

  });
});
