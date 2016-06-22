jest.unmock("../tasks/Task.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Task from '../tasks/Task.es6.jsx';

function taskProps(completed=false) {
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
    const { output, props } = setup(taskProps());

    expect(output.type).toEqual('li');
    expect(output.props.className).toEqual('list-group-item-unstyled task-item');

    let div = output.props.children;
    expect(div.type).toEqual('div');
    expect(div.props.className).toEqual('checkbox');

    let [ label, span ] = div.props.children;
    expect(label.type).toEqual('label');
    expect(label.props.className).toEqual('task-label');
    expect(label.props.style.textDecoration).toEqual('none');

    expect(span.type).toEqual('span');
    expect(span.props.className).toEqual('glyphicon glyphicon-trash pull-right delete-task');
    expect(span.props.children).toBeUndefined();

    let [ input, emptySpace, title ] = label.props.children;
    expect(input.type).toEqual('input');
    expect(input.props.type).toEqual('checkbox');
    expect(input.props.checked).toBe(false);
    expect(emptySpace).toEqual(' ');
    expect(title).toEqual(props.title);
  });

  describe('when completed', () => {
    let label, input;

    beforeEach(() => {
      const { output } = setup(taskProps(true));
      label = output.props.children.props.children[0];
      input = label.props.children[0];
    });

    it('marks Task as completed', () => {
      expect(input.props.checked).toBe(true);
    });

    it('strikes through the Task', () => {
      expect(label.props.style.textDecoration).toEqual('line-through');
    });
  });
});
