require 'spec_helper'

describe Idea do
  it "has a valid factory" do
    expect(FactoryGirl.create(:idea)).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:idea, title: nil)).not_to be_valid
  end

  it "is invalid without status" do
    expect(FactoryGirl.build(:idea, status: nil)).not_to be_valid
  end

  it "is invalid without score" do
    expect(FactoryGirl.build(:idea, score: nil)).not_to be_valid
    pry
  end
end