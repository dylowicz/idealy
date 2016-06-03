require 'spec_helper'
require_relative 'support/shared_examples'

describe UsersController, type: :controller do
  include_examples "Set before and after all for User"
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
    end
  end

  describe "POST #create" do
    context "as authorized user" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for(:user)
        post :create, params: { user: @user_attributes}
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to set_flash[:success].to("User #{@user_attributes[:name]} successfully created!") }
      it { is_expected.to redirect_to(ideas_path) }
    end

    context "as unauthorized user" do
      context "with valid attributes" do
        before(:each) do
          @user_attributes = FactoryGirl.attributes_for(:user)
          post :create, params: { user: @user_attributes }
        end

        it { is_expected.to respond_with :found }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to set_flash[:success].to("User #{@user_attributes[:name]} successfully created!") }
        it { is_expected.to redirect_to(ideas_path) }
      end

      context "with invalid attributes" do
        before(:each) do
          post :create, params: { user: FactoryGirl.attributes_for(:user, :invalid) }
        end

        it { is_expected.to respond_with :ok }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to set_flash.now[:danger].to("User could not be created.") }
      end
    end
  end
end
