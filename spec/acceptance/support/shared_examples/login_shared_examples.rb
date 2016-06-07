require 'spec_helper'

shared_examples "Login" do
  describe "Login user" do
    before(:all) do
      visit(LoginPage)
    end

    it "logs in a user" do
      on(LoginPage).login_with(user.email, user.password)
      expect(on(IdeasPage).flash_message_element.when_visible.text).to eq "Successfully logged in."
      expect(on(Dashboard).user_name_element.when_visible.text).to eq user.name
    end
  end
end