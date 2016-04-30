require 'spec_helper'

describe Task, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:task)).to be_valid
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:task, title: nil)).not_to be_valid
  end

  it "is invalid without an idea reference" do
    expect(FactoryGirl.build(:task, idea: nil)).not_to be_valid
  end

  it "is invalid with completed set as nil" do
    expect(FactoryGirl.build(:task, completed: nil)).not_to be_valid
  end
end
