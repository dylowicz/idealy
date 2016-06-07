class TasksPage < BasePage

  div(:tasks_box, id: 'tasks-box')
  unordered_list(:tasks_list, id: 'tasks-list')
  paragraph(:tasks_info, id: 'no-tasks-info')
  span(:tasks_counter, id: 'todo-tasks-counter')
  text_field(:add_task_title_textfield, id: 'add-task-title-textfield')
  span(:delete, class: 'delete-task')

  def tasks
    tasks_list_element.list_item_elements(class: 'task-item')
  end

  def find_by_title(title)
    tasks.find { |e| e.label_element(class: 'task-label', text: title) }
  end

  def add_task_with(title)
    wait_for(add_task_title_textfield_element)
    self.add_task_title_textfield = title
    self.add_task_title_textfield_element.send_keys :enter
  end

  def toggle_task(title)
    wait_for(tasks_list_element)
    find_by_title(title).click
  end

  def delete_task(title)
    wait_for(tasks_list_element)
    find_by_title(title).hover
    delete_element.click
  end
end
