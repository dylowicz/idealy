jest.unmock("../notes/NoteList.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NoteList from '../notes/NoteList.es6.jsx';
import NoteContainer from '../notes/NoteContainer.es6.jsx';

describe('NoteList', () => {
  let output, props;

  beforeEach(() => {
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

    props = {
      notes: notes,
      onNoteEditSaveClick: Function,
      onNoteDeleteClick: Function
    };

    const renderer = TestUtils.createRenderer();
    renderer.render(<NoteList {...props} />);
    output = renderer.getRenderOutput();
  });

  it('renders NoteList component correctly', () => {
    expect(output.type).toEqual('div');
    expect(output.props.className).toEqual('list-unstyled');
    expect(output.props.id).toEqual('notes-list');
  });

  it('renders NoteContainers in NoteList component correctly', () => {
    const assertComponentToNote = (component, note) => {
      expect(component).toBeDefined();
      expect(component.type).toEqual(NoteContainer);
      expect(component.key).toEqual(note.id.toString());
      expect(component.props.note).toEqual(note);
      expect(component.props.onNoteEditSaveClick).toBeDefined();
      expect(component.props.onNoteDeleteClick).toBeDefined();
    }

    output.props.children.forEach((component, index) => {
      assertComponentToNote(component, props.notes[index]);
    });
  });
});
