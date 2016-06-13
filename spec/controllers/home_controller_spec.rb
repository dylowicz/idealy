require 'rails_helper'
require_relative 'support/shared_examples'

describe HomeController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  include_examples "Validate skip before action", :require_login

  describe "GET #index" do
    context "as authorized user" do
      before(:each) do
        get :index, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to redirect_to(ideas_path) }
    end

    context "as unauthorized user" do
      before(:each) { get :index }

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.not_to redirect_to(ideas_path) }
    end
  end
end
