jest.unmock("../notes/NoteForm.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import NoteForm from '../notes/NoteForm.es6.jsx';

describe('NoteForm', () => {
  let output, props;

  beforeEach(() => {
    props = {
      onNoteSubmit: Function
    };

    const renderer = TestUtils.createRenderer();
    renderer.render(<NoteForm {...props} />);
    output = renderer.getRenderOutput();
  });

  it('renders NoteForm component correctly', () => {
    expect(output.type).toEqual('form');
    expect(output.props.onSubmit).toBeDefined();

    let [ divFormGroup, input ] = output.props.children;
    expect(divFormGroup.type).toEqual('div');
    expect(divFormGroup.props.className).toEqual('form-group');

    expect(input.type).toEqual('input');
    expect(input.props.type).toEqual('submit');
    expect(input.props.value).toEqual('Add Thought');
    expect(input.props.className).toEqual('btn btn-primary');
    expect(input.props.id).toEqual('add-note');

    let textarea = divFormGroup.props.children;
    expect(textarea.type).toEqual('textarea');
    expect(textarea.props.className).toEqual('form-control');
    expect(textarea.props.id).toEqual('add-note-content-textarea');
    expect(textarea.props.placeholder).toEqual('Enter your thought');
    expect(textarea.ref).toBeDefined();
  });
});
