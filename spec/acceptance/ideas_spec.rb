require 'spec_helper'

IDEA_STATUSES = ["new", "active", "dropped", "done"]

describe "Ideas" do
  before(:all) do
    @idea = FactoryGirl.build(:idea)
    @updated_idea = FactoryGirl.build(:idea, status: IDEA_STATUSES.sample)
  end

  include_examples "Login with new user"
  include_examples "Create Idea"
  include_examples "Update Idea"
  include_examples "Delete Idea"
end
