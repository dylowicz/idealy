require 'spec_helper'

shared_examples "Login with new user" do
  describe "Login user" do
    before(:all) do
      visit(LoginPage)
    end

    let(:user) { FactoryGirl.create(:user) }

    it "logs in a user" do
      on(LoginPage).login_with(user.email, user.password)
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "Successfully logged in."
      expect(on(Dashboard).user_name_element.when_visible.text).to eq user.name
    end

    context "on Ideas page after login" do
      it "finds no ideas" do
        expect(on(IdeasPage).ideas_info_element.when_visible.text).to eq "You have no ideas yet."
      end
    end
  end
end
