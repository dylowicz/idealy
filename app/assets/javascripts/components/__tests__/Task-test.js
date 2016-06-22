jest.unmock("../tasks/Task.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Task from '../tasks/Task.es6.jsx';

function taskProps(completed) {
  return {
    title: "There's some title!",
    completed: completed,
    onTaskClick: jasmine.createSpy(),
    onTaskDeleteClick: jasmine.createSpy()
  };
}

function setup(props) {
  const renderer = TestUtils.createRenderer();
  renderer.render(<Task {...props} />);
  const output = renderer.getRenderOutput();

  return { output, props };
}

describe('Task', () => {
  it('renders Task component correctly', () => {
    const { output, props } = setup(taskProps(false));

    expect(output.type).toBe('li');
    expect(output.props.className).toBe('list-group-item-unstyled task-item');

    let div = output.props.children;
    expect(div.type).toBe('div');
    expect(div.props.className).toBe('checkbox');

    let [ label, span ] = div.props.children;
    expect(label.type).toBe('label');
    expect(label.props.className).toBe('task-label');
    expect(label.props.style.textDecoration).toBe('none');

    expect(span.type).toBe('span');
    expect(span.props.className).toBe('glyphicon glyphicon-trash pull-right delete-task');
    expect(span.props.children).toBe(undefined);

    let [ input, emptySpace, title ] = label.props.children;
    expect(input.type).toBe('input');
    expect(input.props.type).toBe('checkbox');
    expect(input.props.checked).toBe(false);
    expect(emptySpace).toBe(' ');
    expect(title).toBe(props.title);
  });

  it('strikes through the Task if it is completed', () => {
    const { output } = setup(taskProps(true));

    let label = output.props.children.props.children[0];
    expect(label.props.style.textDecoration).toBe('line-through');
  });
});
