require 'spec_helper'

describe Idea, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:idea)).to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:notes).dependent(:destroy) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:score) }
end