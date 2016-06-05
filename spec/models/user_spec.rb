require 'rails_helper'

describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it { is_expected.to have_many(:ideas).dependent(:destroy) }

  describe "name validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(50) }
  end

  describe "email validation" do
    let(:invalid_email) { "test#example.com" }
    let(:upcased_email) { "TEST@EXAMPLE.COM" }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.not_to allow_value(invalid_email).for(:email) }


    it "is saved with downcased email" do
      user_with_upcased_email = FactoryGirl.create(:user, email: upcased_email)
      expect(user_with_upcased_email.email).to eql upcased_email.downcase
    end
  end

  describe "password validation" do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end
end
