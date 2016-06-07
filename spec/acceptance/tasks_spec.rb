require 'spec_helper'

describe "Tasks" do
  before(:all) do
    @idea = FactoryGirl.build(:idea)
    @task = FactoryGirl.build(:task)
  end

  include_examples "Login with new user"
  include_examples "Create Idea"

  include_examples "Create Task"
  include_examples "Update Task"
  include_examples "Delete Task"
end
