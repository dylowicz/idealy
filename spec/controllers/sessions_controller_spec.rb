require 'spec_helper'
require_relative 'support/shared_examples'

describe SessionsController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  include_examples "Validate skip before action", :require_login

  describe "GET #new" do
    context "as authorized user" do
      before(:each) do
        get :new, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to redirect_to(root_path) }
    end

    context "as unauthorized user" do
      before(:each) { get :new }

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.not_to redirect_to(root_path) }
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:each) do
        post :create, params: { session: { email: @user.email, password: @user.password } }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to redirect_to(ideas_path) }
      it { is_expected.to set_flash[:success].to("Successfully logged in.") }
    end

    context "with invalid email attribute" do
      before(:each) do
        post :create, params: { session: { email: nil, password: @user.password } }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.not_to redirect_to(ideas_path) }
      it { is_expected.to set_flash.now[:danger].to("Provided e-mail does not exist.") }
    end

    context "with invalid password attribute" do
      before(:each) do
        post :create, params: { session: { email: @user.email, password: nil } }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.not_to redirect_to(ideas_path) }
      it { is_expected.to set_flash.now[:danger].to("Wrong password provided.") }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy
    end

    it { is_expected.to respond_with :found }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to redirect_to(login_path) }
    it { is_expected.to set_flash[:success].to("Successfully logged out.") }
  end
end
