require 'spec_helper'

describe User, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe "name validation" do
    it "is invalid without a name" do
      expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
    end

    it "is invalid with a duplicated name" do
      FactoryGirl.create(:user, name: "test")
      user_with_duplicated_name = FactoryGirl.build(:user, name: "test")

      expect(user_with_duplicated_name).not_to be_valid
      expect(user_with_duplicated_name.errors[:name]).to include "has already been taken"
    end

    it "is invalid with name length shorter than 3 characters" do
      user_with_too_short_name = FactoryGirl.build(:user, name: "a"*2)
      expect(user_with_too_short_name).not_to be_valid
      expect(user_with_too_short_name.errors[:name]).to include "is too short (minimum is 3 characters)"
    end

    it "is invalid with name length longer than 50 characters" do
      user_with_too_long_name = FactoryGirl.build(:user, name: "a"*51)
      expect(user_with_too_long_name).not_to be_valid
      expect(user_with_too_long_name.errors[:name]).to include "is too long (maximum is 50 characters)"
    end
  end

  describe "email validation" do
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "is invalid with wrong email format" do
      user_with_wrong_email_format = FactoryGirl.build(:user, email: "test#example.com")
      expect(user_with_wrong_email_format).not_to be_valid
    end

    it "is invalid with a duplicated email" do
      FactoryGirl.create(:user, email: "test@example.com")
      user_with_duplicated_email = FactoryGirl.build(:user, email: "test@example.com")

      expect(user_with_duplicated_email).not_to be_valid
      expect(user_with_duplicated_email.errors[:email]).to include "has already been taken"
    end

    it "is saved with downcased email" do
      upcased_email = "TEST@EXAMPLE.COM"
      user_with_upcased_email = FactoryGirl.create(:user, email: upcased_email)
      expect(user_with_upcased_email.email).to eql upcased_email.downcase
    end
  end

  describe "password validation" do
    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end


    it "is invalid with password length shorter than 6 characters" do
      user_with_too_short_password = FactoryGirl.build(:user, password: "a"*5)
      expect(user_with_too_short_password).not_to be_valid
      expect(user_with_too_short_password.errors[:password]).to include "is too short (minimum is 6 characters)"
    end
  end
end
