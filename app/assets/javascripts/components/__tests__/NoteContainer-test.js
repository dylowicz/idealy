jest.unmock("../notes/NoteContainer.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NoteContainer from '../notes/NoteContainer.es6.jsx';
import Note from '../notes/Note.es6.jsx';

describe('NoteContainer', () => {
  describe('structure', () => {
    let output, props;

    beforeEach(() => {
      props = {
        title: "Are there any questions?",
        content: "There is some content",
        created_at: "2016-06-08T00:27:00.490Z"
      }
      const renderer = TestUtils.createRenderer();
      renderer.render(<NoteContainer note={props} />);
      output = renderer.getRenderOutput();
    });

    it('renders NoteContainer component correctly', () => {
      expect(output.type).toEqual(Note);
      expect(output.props.title).toEqual(props.title);
      expect(output.props.content).toEqual(props.content);
      expect(output.props.created_at).toEqual(props.created_at);
      expect(output.props.onNoteEditDoubleClick).toBeDefined();
      expect(output.props.onNoteSaveClick).toBeDefined();
      expect(output.props.onNoteCancelClick).toBeDefined();
      expect(output.props.onNoteDeleteClick).toBeUndefined();
      expect(output.props.inEditMode).toEqual(false);
      expect(output.props.textAreaHeight).toEqual(0);
    });
  });

  xdescribe('behavior', () => {

  });
});
