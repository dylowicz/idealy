jest.unmock("../tasks/TaskList.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import TaskList from '../tasks/TaskList.es6.jsx';
import Task from '../tasks/Task.es6.jsx';

describe('TaskList', () => {
  let output, props;

  beforeEach(() => {
    const tasks = [
      {
        id: 1,
        title: "There's some title!",
        completed: false
      },
      {
        id: 2,
        title: "Another task with another title.",
        completed: true
      },
      {
        id: 3,
        title: "That's the last task with some title",
        completed: false
      }
    ];

    props = {
      tasks: tasks,
      onTaskClick: Function,
      onTaskDeleteClick: Function
    };

    const renderer = TestUtils.createRenderer();
    renderer.render(<TaskList {...props} />);
    output = renderer.getRenderOutput();
  });

  it('renders TaskList component correctly', () => {
    expect(output.type).toEqual('ul');
    expect(output.props.className).toEqual('list-unstyled checked-list-box');
    expect(output.props.id).toEqual('tasks-list');
  });

  it('renders Tasks in TaskList component correctly', () => {
    for (let i = 0; i < output.props.children.length; i++) {
      expect(JSON.stringify(output.props.children[i])).toEqual(
        JSON.stringify(<Task key={props.tasks[i].id} {...props.tasks[i]} onTaskClick={Function} onTaskDeleteClick={Function} />)
      );
    }
  });
});
