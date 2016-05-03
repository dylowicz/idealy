require 'spec_helper'

describe SessionsHelper, :type => :helper do
  describe "user authentication" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      log_in @user
    end

    it "sets current user" do
      expect(current_user).to eql @user
    end

    it "logs in a user" do
      expect(logged_in?).to be true
    end

    it "logs out a user" do
      log_out
      expect(logged_in?).to be false
    end
  end
end
