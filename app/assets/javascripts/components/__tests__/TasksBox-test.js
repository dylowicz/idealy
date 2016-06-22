jest.unmock("../tasks/TasksBox.es6.jsx");
jest.unmock("../tasks/TaskList.es6.jsx");
jest.unmock("../tasks/TaskForm.es6.jsx")

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import TasksBox from '../tasks/TasksBox.es6.jsx';
import TaskList from '../tasks/TaskList.es6.jsx';
import TaskForm from '../tasks/TaskForm.es6.jsx';

function setup(tasks=[]) {
  const renderer = TestUtils.createRenderer();
  renderer.render(<TasksBox tasks={tasks} />);
  const output = renderer.getRenderOutput();

  return output;
}

describe('TasksBox', () => {
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

  describe('structure', () => {
    describe('when no tasks', () => {
      let output;

      beforeEach(() => {
        output = setup();
      });

      it('renders TasksBox component correctly', () => {
        expect(output.type).toEqual('div');
        expect(output.props.className).toEqual('container-fluid');
        expect(output.props.id).toEqual('tasks-box');

        let [ h3, div ] = output.props.children;
        expect(h3.type).toEqual('h3');
        expect(h3.props.className).toEqual('text-center');

        expect(div.type).toEqual('div');
        expect(div.props.className).toEqual('well');

        let [ text, emptySpace ] = h3.props.children;
        expect(text).toEqual('Tasks');
        expect(emptySpace).toEqual(' ');

        let [ p, taskForm ] = div.props.children;
        expect(p.type).toEqual('p');
        expect(p.props.className).toEqual('text-muted text-center');
        expect(p.props.id).toEqual('no-tasks-info');
        expect(p.props.children).toEqual("There's nothing to do!");

        expect(taskForm).toBeDefined();
        expect(taskForm.type).toEqual(TaskForm);
        expect(taskForm.props.onTaskSubmit).toBeDefined();
      });
    });

    describe('when tasks', () => {
      let tasksCounter, taskList;

      beforeEach(() => {
        const output = setup(tasks);

        let [ h3, div ] = output.props.children;
        tasksCounter = h3.props.children[2];
        taskList = div.props.children[0];
      });

      it('renders Tasks counter', () => {
        const completedTasks = tasks.filter(task => !task.completed);

        expect(tasksCounter.type).toEqual('span');
        expect(tasksCounter.props.className).toEqual('badge');
        expect(tasksCounter.props.id).toEqual('todo-tasks-counter');
        expect(tasksCounter.props.children).toEqual(completedTasks.length);
      });

      it('renders list of Tasks', () => {
        expect(taskList).toBeDefined();
        expect(taskList.type).toEqual(TaskList);
        expect(taskList.props.tasks.length).toEqual(tasks.length);
        expect(taskList.props.tasks).toEqual(tasks);
        expect(taskList.props.onTaskClick).toBeDefined();
        expect(taskList.props.onTaskDeleteClick).toBeDefined();
      });
    });
  });

  xdescribe('behavior', () => {

  });
});
