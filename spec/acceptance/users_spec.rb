require 'spec_helper'

describe "Users" do
  before(:all) do
    user = FactoryGirl.attributes_for(:user)
    @name = user[:name]
    @email = user[:email]
    @password = user[:password]
  end

  describe "Sign up" do
    it "finds sign-up link on home page" do
      expect(on(HomePage).signup_element.when_visible.text).to eq "Sign up now!"
    end

    it "goes to sign up page" do
      on(HomePage).go_to_signup
      expect(on(SignUpPage).signup_header_element.when_visible.text).to eq "Sign up"
    end

    it "creates a user" do
      on(SignUpPage).signup(@name, @email, @password)
    end

    it "automatically logs in a user" do
      expect(on(Dashboard).user_name_element.when_visible.text).to eq @name
    end

    it "redirects to Ideas page" do
      expect(on(IdeasPage).ideas_header_element.visible?).to be_truthy
    end

    it "displays information about successful user creation" do
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "User #{@name} successfully created!"
    end
  end

  describe "Logout" do
    it "logouts a user" do
      on(Dashboard).logout_user
      expect(on(Dashboard).user_name_element.exists?).to be_falsy
      expect(on(Dashboard).login_element.when_visible.text).to eq "Sign in"
    end

    it "displays information about successful logout" do
      expect(on(HomePage).flash_message_element.when_visible.text).to eq "Successfully logged out."
    end

    it "redirects to Login page" do
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end
  end

  describe "Login" do
    before(:all) do
      visit HomePage
    end

    it "goes to login page" do
      on(Dashboard).go_to_login
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end

    it "logins the user" do
      on(LoginPage).login_with(@email, @password)
      expect(on(Dashboard).user_name_element.when_visible.text).to eq @name
    end

    it "redirects to Ideas page" do
      expect(on(IdeasPage).ideas_header_element.visible?).to be_truthy
    end

    it "displays information about successful login" do
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "Successfully logged in."
    end
  end
end
