jest.unmock("../tasks/Task.es6.jsx");

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Task from '../tasks/Task.es6.jsx';

const { createRenderer, renderIntoDocument, scryRenderedDOMComponentsWithTag } = TestUtils;
const { findDOMNode } = ReactDOM;

describe('Task', () => {
  let props, output, renderer;

  beforeEach(() => {
    props = {
      title: "There's some title!",
      completed: false,
      onTaskClick: jasmine.createSpy(),
      onTaskDeleteClick: jasmine.createSpy()
    };

    renderer = TestUtils.createRenderer();
    renderer.render(<Task {...props} />);
    output = renderer.getRenderOutput();
  });

  it('renders correctly', () => {
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

  it('marks task as completed on task click', () => {
    // const renderer = createRenderer();
    // const task = renderer.render(<Task title="Title" completed={true} />);
    // console.log(task.props.className);
    // expect(task.props.className).toEqual('list-group-item-unstyled task-item');
    //
    // const taskComponent = renderIntoDocument(
    //   <div><Task title="Title" completed={true} /></div>
    // );
    // const taskNode = findDOMNode(taskComponent).children[0];
    //
    // console.log(taskNode);
    // expect(taskNode.className).toEqual('list-group-item-unstyled task-item');


  });

  it('it strikes through the task if it is completed', () => {

  });
});
