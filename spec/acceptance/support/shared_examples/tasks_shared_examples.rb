require 'spec_helper'

shared_examples "Create Task" do
  describe "Create Task" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
    end

    context "with valid data" do
      it "creates a Task" do
        on(TasksPage).add_task_with @task.title
        @current_page.wait_for(on(TasksPage).tasks_list_element)
      end

      it "displays Task's title" do
        expect(on(TasksPage).find_by_title(@task.title)).not_to be_nil
      end

      it "shows not completed Tasks counter" do
        expect(on(TasksPage).tasks_counter_element.when_visible.text).to eq "1"
      end
    end

    context "with invalid data" do
      before(:all) { @count_of_tasks = on(TasksPage).tasks.length}

      it "tries to create an empty Task" do
        on(TasksPage).add_task_with(nil)
        @current_page.wait_for(on(TasksPage).tasks_list_element)
      end

      it "does not create an empty Task" do
        expect(on(TasksPage).tasks.length).to eq @count_of_tasks
      end
    end
  end
end

shared_examples "Update Task" do
  describe "Update Task" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
    end

    it "toggles a Task" do
      on(TasksPage).toggle_task(@task.title)
      @current_page.wait_for(on(TasksPage).tasks_list_element)
    end

    it "displays line-through Task's title" do
      expect(on(TasksPage).find_by_title(@task.title).label_element.style('text-decoration')).to eq 'line-through'
    end

    it "displays checked Task's checkbox" do
      expect(on(TasksPage).find_by_title(@task.title).checkbox_element.checked?).to be_truthy
    end

    it "hides not completed Tasks counter" do
      expect(on(TasksPage).tasks_counter_element.exists?).to be_falsy
    end
  end
end

shared_examples "Delete Task" do
  describe "Delete Task" do
    before(:all) do
      visit(IdeasPage)
      on(IdeasPage).go_to_idea @idea.title
    end

    it "deletes a Task" do
      on(TasksPage).delete_task(@task.title)
      @current_page.wait_for(on(TasksPage).tasks_info_element)
    end

    it "finds no Tasks" do
      expect(on(TasksPage).tasks_list_element.exists?).to be_falsy
    end

    it "displays no Tasks info" do
      expect(on(TasksPage).tasks_info_element.when_visible.text).to eq "There's nothing to do!"
    end
  end
end
