require 'spec_helper'

describe "Users" do
  before(:all) do
    user = FactoryGirl.attributes_for(:user)
    @name = user[:name]
    @email = user[:email]
    @password = user[:password]
  end

  describe "Sign up" do
    it "goes to login page" do
      on(Dashboard).go_to_login
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end

    it "goes to sign up page" do
      on(LoginPage).go_to_signup
      expect(on(SignUpPage).signup_header_element.when_visible.text).to eq "Sign up"
    end

    it "creates a user" do
      on(SignUpPage).signup(@name, @email, @password)
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "User #{@name} successfully created!"
    end

    it "automatically logs in a user" do
      expect(on(Dashboard).user_name_element.when_visible.text).to eq @name
    end

    it "redirects to Ideas page" do
      expect(on(IdeasPage).ideas_header_element.visible?).to be_truthy
    end
  end

  describe "Logout" do
    it "logouts a user" do
      on(Dashboard).logout_user
      expect(on(HomePage).flash_message_element.when_visible.text).to eq "Successfully logged out."
    end

    it "redirects to Login page" do
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end
  end

  describe "Login" do
    it "goes to login page" do
      on(Dashboard).go_to_login
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end

    it "logins the user" do
      on(LoginPage).login_user(@email, @password)
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "Successfully logged in."
      expect(on(Dashboard).user_name_element.when_visible.text).to eq @name
    end

    it "redirects to Ideas page" do
      expect(on(IdeasPage).ideas_header_element.visible?).to be_truthy
    end
  end
end
