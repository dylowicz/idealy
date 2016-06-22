jest.unmock("../tasks/TaskForm.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import TaskForm from '../tasks/TaskForm.es6.jsx';

describe('TaskForm', () => {
  let output, props;

  beforeEach(() => {
    props = {
      onTaskSubmit: Function
    };

    const renderer = TestUtils.createRenderer();
    renderer.render(<TaskForm {...props} />);
    output = renderer.getRenderOutput();
  });

  it('renders TaskForm component correctly', () => {
    expect(output.type).toEqual('form');
    expect(output.props.onSubmit).toBeDefined();

    let divInputGroup = output.props.children;
    expect(divInputGroup.type).toEqual('div');
    expect(divInputGroup.props.className).toEqual('input-group');

    let [ divInputGroupAddon, input ] = divInputGroup.props.children;
    expect(divInputGroupAddon.type).toEqual('div');
    expect(divInputGroupAddon.props.className).toEqual('input-group-addon');

    expect(input.type).toEqual('input');
    expect(input.props.type).toEqual('text');
    expect(input.props.className).toEqual('form-control');
    expect(input.props.id).toEqual('add-task-title-textfield');
    expect(input.props.placeholder).toEqual('Add a new task');
    expect(input.ref).toBeDefined();

    let span = divInputGroupAddon.props.children;
    expect(span.type).toEqual('span');
    expect(span.props.className).toEqual('glyphicon glyphicon-plus');
    expect(span.props.children).toEqual(undefined);
  });
});
