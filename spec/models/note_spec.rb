require 'spec_helper'

describe Note, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:note)).to be_valid
  end

  it "is invalid without a content" do
    expect(FactoryGirl.build(:note, content: nil)).not_to be_valid
  end

  it "is invalid without a type" do
    expect(FactoryGirl.build(:note, type: nil)).not_to be_valid
  end

  it "is invalid without an idea reference" do
    expect(FactoryGirl.build(:note, idea: nil)).not_to be_valid
  end
end
