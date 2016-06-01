require 'spec_helper'

describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe "name validation" do
    let(:valid_name) { "Test" }
    let(:too_short_name) { "a"*2 }
    let(:too_long_name) { "a"*51 }

    it "is invalid without a name" do
      expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
    end

    it "is invalid with a duplicated name" do
      FactoryGirl.create(:user, name: valid_name)
      user_with_duplicated_name = FactoryGirl.build(:user, name: valid_name)

      expect(user_with_duplicated_name).not_to be_valid
      expect(user_with_duplicated_name.errors[:name]).to include "has already been taken"
    end

    it "is invalid with name length shorter than 3 characters" do
      user_with_too_short_name = FactoryGirl.build(:user, name: too_short_name)
      expect(user_with_too_short_name).not_to be_valid
      expect(user_with_too_short_name.errors[:name]).to include "is too short (minimum is 3 characters)"
    end

    it "is invalid with name length longer than 50 characters" do
      user_with_too_long_name = FactoryGirl.build(:user, name: too_long_name)
      expect(user_with_too_long_name).not_to be_valid
      expect(user_with_too_long_name.errors[:name]).to include "is too long (maximum is 50 characters)"
    end
  end

  describe "email validation" do
    let(:invalid_email) { "test#example.com" }
    let(:valid_email) { "test@example.com" }
    let(:upcased_email) { "TEST@EXAMPLE.COM" }

    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "is invalid with wrong email format" do
      user_with_wrong_email_format = FactoryGirl.build(:user, email: invalid_email)
      expect(user_with_wrong_email_format).not_to be_valid
    end

    it "is invalid with a duplicated email" do
      FactoryGirl.create(:user, email: valid_email)
      user_with_duplicated_email = FactoryGirl.build(:user, email: valid_email)

      expect(user_with_duplicated_email).not_to be_valid
      expect(user_with_duplicated_email.errors[:email]).to include "has already been taken"
    end

    it "is saved with downcased email" do
      user_with_upcased_email = FactoryGirl.create(:user, email: upcased_email)
      expect(user_with_upcased_email.email).to eql upcased_email.downcase
    end
  end

  describe "password validation" do
    let(:too_short_password) { "a"*5 }

    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end


    it "is invalid with password length shorter than 6 characters" do
      user_with_too_short_password = FactoryGirl.build(:user, password: too_short_password)
      expect(user_with_too_short_password).not_to be_valid
      expect(user_with_too_short_password.errors[:password]).to include "is too short (minimum is 6 characters)"
    end
  end
end
