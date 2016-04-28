require 'spec_helper'

describe Idea do
  it "has a valid factory" do
    expect(FactoryGirl.create(:idea)).to be_valid
  end
end