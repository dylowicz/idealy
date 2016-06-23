jest.unmock("../notes/Note.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Note from '../notes/Note.es6.jsx';

function noteProps(mode=false) {
  return {
    content: "There is some content",
    created_at: "2016-06-08T00:27:00.490Z",
    onNoteEditContentClick: Function,
    onNoteSaveClick: Function,
    onNoteCancelClick: Function,
    onNoteDeleteClick: Function,
    inEditMode: mode,
    inputHeight: 40
  };
}

function setup(props) {
  const renderer = TestUtils.createRenderer();
  renderer.render(<Note {...props} />);
  const output = renderer.getRenderOutput();

  return { output, props };
}

describe('Note', () => {
  it('renders Note component correctly', () => {
    const { output, props } = setup(noteProps());

    expect(output.type).toEqual('div');
    expect(output.props.className).toEqual('panel panel-primary note-item');

    const [ panelBody, panelFooter ] = output.props.children;
    expect(panelBody.type).toEqual('div');
    expect(panelBody.props.className).toEqual('panel-body note-content');
    expect(panelBody.props.children).toEqual(props.content);
    expect(panelBody.props.onDoubleClick).toBeDefined();

    expect(panelFooter.type).toEqual('div');
    expect(panelFooter.props.className).toEqual('panel-footer note-footer');

    const [ dateSpan, deleteButton ] = panelFooter.props.children;
    expect(dateSpan.type).toEqual('small');
    expect(dateSpan.props.className).toEqual('text-muted note-created-at');
    expect(dateSpan.props.children).toEqual(new Date(props.created_at.slice(0, -1)).toLocaleString());

    expect(deleteButton.type).toEqual('span');
    expect(deleteButton.props.className).toEqual('glyphicon glyphicon-trash pull-right delete-note');
    expect(deleteButton.props.children).toBeUndefined();
  });

  describe('when in edit mode', () => {
    let props, textarea, editActionButtons;

    beforeEach(() => {
      const setupObject = setup(noteProps(true));
      props = setupObject.props;
      textarea = setupObject.output.props.children[0];
      editActionButtons = setupObject.output.props.children[1].props.children[0];
    });

    it('renders textarea', () => {
      expect(textarea.type).toEqual('textarea');
      expect(textarea.props.className).toEqual('form-control edit-note-content-textarea');
      expect(textarea.props.style.height).toEqual(props.inputHeight);
      expect(textarea.props.defaultValue).toEqual(props.content);
      expect(textarea.ref).toBeDefined();
    });

    it('renders edit action buttons', () => {
      expect(editActionButtons.type).toEqual('div');
      expect(editActionButtons.props.style.display).toEqual('inline');

      const [ saveButton, emptySpace, cancelButton ] = editActionButtons.props.children;
      expect(emptySpace).toEqual(' ');
      expect(saveButton.type).toEqual('a');
      expect(saveButton.props.className).toEqual('save-edit-note');
      expect(saveButton.props.children).toEqual('Save');
      expect(saveButton.props.onClick).toBeDefined();

      expect(cancelButton.type).toEqual('a');
      expect(cancelButton.props.className).toEqual('text-muted cancel-edit-note');
      expect(cancelButton.props.children).toEqual('Cancel');
      expect(cancelButton.props.onClick).toBeDefined();
    });
  });
});
