jest.unmock("../notes/NotesBox.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NotesBox from '../notes/NotesBox.es6.jsx';
import NoteList from '../notes/NoteList.es6.jsx';
import NoteForm from '../notes/NoteForm.es6.jsx';

function setup(notes=[]) {
  const renderer = TestUtils.createRenderer();
  renderer.render(<NotesBox notes={notes} />);
  const output = renderer.getRenderOutput();

  return output;
}

describe('NotesBox', () => {
  const notes = [
    {
      id: 1,
      content: "There is some content",
      created_at: "2016-06-08T00:27:00.490Z"
    },
    {
      id: 2,
      content: "Another task with another title.",
      created_at: "2016-06-08T00:27:00.490Z"
    },
    {
      id: 3,
      content: "That's the last task with some title",
      created_at: "2016-06-08T00:27:00.490Z"
    }
  ];

  describe('structure', () => {
    describe('when no notes', () => {
      let output;

      beforeEach(() => {
        output = setup();
      });

      it('renders NotesBox component correctly', () => {
        expect(output.type).toEqual('div');
        expect(output.props.className).toEqual('container-fluid');
        expect(output.props.id).toEqual('notes-box');

        let [ h3, div ] = output.props.children;
        expect(h3.type).toEqual('h3');
        expect(h3.props.className).toEqual('text-center');
        expect(h3.props.id).toEqual('notes-header');
        expect(h3.props.children).toEqual('Thoughts');

        expect(div.type).toEqual('div');
        expect(div.props.className).toEqual('well');

        let [ p, noteForm ] = div.props.children;
        expect(p.type).toEqual('p');
        expect(p.props.className).toEqual('text-muted text-center');
        expect(p.props.id).toEqual('no-notes-info');
        expect(p.props.children).toEqual("Nothing has been said, yet!");

        expect(noteForm).toBeDefined();
        expect(noteForm.type).toEqual(NoteForm);
        expect(noteForm.props.onNoteSubmit).toBeDefined();
      });
    });

    describe('when notes', () => {
      let noteList;

      beforeEach(() => {
        const output = setup(notes);

        let [ h3, div ] = output.props.children;
        noteList = div.props.children[0];
      });

      it('renders list of Notes', () => {
        expect(noteList).toBeDefined();
        expect(noteList.type).toEqual(NoteList);
        expect(noteList.props.notes.length).toEqual(notes.length);
        expect(noteList.props.notes).toEqual(notes);
        expect(noteList.props.onNoteEditSaveClick).toBeDefined();
        expect(noteList.props.onNoteDeleteClick).toBeDefined();
      });
    });
  });

  xdescribe('behavior', () => {

  });
});
