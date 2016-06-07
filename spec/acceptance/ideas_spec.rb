require 'spec_helper'

describe "Ideas" do
  before(:all) do
    @idea = FactoryGirl.build(:idea)
    @updated_idea = FactoryGirl.build(:idea, status: ["active", "dropped", "done"].sample)
  end

  let(:user) { FactoryGirl.create(:user) }
  include_examples "Login"

  context "on ideas page after login" do
    it "finds no ideas" do
      expect(on(IdeasPage).ideas_info_element.when_visible.text).to eq "You have no ideas yet."
    end
  end

  include_examples "Create Idea"
  include_examples "Update Idea"
  include_examples "Delete Idea"
end