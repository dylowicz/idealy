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

    context "with invalid data" do
      it "tries to send form with emtpy fields" do
        on(SignUpPage).signup(nil, nil, nil)
      end

      it "displays error about blank password" do
        expect(on(SignUpPage).find_error("Password can't be blank")).to be_truthy
      end

      it "displays error about too short password" do
        expect(on(SignUpPage).find_error("Password is too short (minimum is 6 characters)")).to be_truthy
      end

      it "displays error about blank name" do
        expect(on(SignUpPage).find_error("Name can't be blank")).to be_truthy
      end

      it "displays error about too short name" do
        expect(on(SignUpPage).find_error("Name is too short (minimum is 3 characters)")).to be_truthy
      end

      it "displays error about blank email" do
        expect(on(SignUpPage).find_error("Email can't be blank")).to be_truthy
      end

      it "displays error about invalid email format" do
        expect(on(SignUpPage).find_error("Email is invalid")).to be_truthy
      end
    end

    context "with valid data" do
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
  end

  describe "Logout" do
    it "logouts a user" do
      on(Dashboard).logout_user
      expect(on(Dashboard).user_name_element.exists?).to be_falsy
      expect(on(Dashboard).login_element.when_visible.text).to eq "Sign in"
    end

    it "redirects to Login page" do
      expect(on(LoginPage).login_header_element.when_visible.text).to eq "Log in"
    end

    it "displays information about successful logout" do
      expect(on(HomePage).flash_message_element.when_visible.text).to eq "Successfully logged out."
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

    context "with invalid data" do
      it "tries to login a user with not existing email" do
        on(LoginPage).login_with(nil, @password)
      end

      it "displays error about not existing email" do
        expect(on(LoginPage).flash_message_element.when_visible.text).to eq 'Provided e-mail does not exist.'
      end

      it "tries to login a user with incorrect password" do
        on(LoginPage).login_with(@email, nil)
      end

      it "displays error about invalid password" do
        expect(on(LoginPage).flash_message_element.when_visible.text).to eq 'Wrong password provided.'
      end
    end

    context "with valid data" do
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
end
