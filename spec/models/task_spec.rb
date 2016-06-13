require 'rails_helper'

describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:task)).to be_valid
  end

  it { is_expected.to belong_to(:idea) }
  it { is_expected.to validate_presence_of(:idea) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to allow_value(true).for(:completed) }
  it { is_expected.to allow_value(false).for(:completed) }
end
