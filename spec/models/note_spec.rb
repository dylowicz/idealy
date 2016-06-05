require 'rails_helper'

describe Note, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:note)).to be_valid
  end

  it { is_expected.to belong_to(:idea) }
  it { is_expected.to validate_presence_of(:idea) }
  it { is_expected.to validate_presence_of(:content) }
end
