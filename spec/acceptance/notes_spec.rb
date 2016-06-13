require 'spec_helper'

describe "Notes" do
  before(:all) do
    @idea = FactoryGirl.build(:idea)
    @note = FactoryGirl.build(:note)
    @updated_note = FactoryGirl.build(:note)
  end

  include_examples "Login with new user"
  include_examples "Create Idea"
  
  include_examples "Create Note"
  include_examples "Update Note"
  include_examples "Delete Note"
end
