require 'spec_helper'
require_relative 'support/shared_examples'

describe IdeasController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    context "as authorized user" do
      before(:each) do
        get :index, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
    end

    context "as unauthorized user" do
      before(:each) { get :index }

      include_examples "Validate unauthorized response"
    end
  end

  describe "GET #show" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }

    context "as authorized user" do
      before(:each) do
        get :show, params: { id: @idea.id }, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
    end

    context "as unauthorized user" do
      before(:each) { get :show, params: { id: @idea.id } }

      include_examples "Validate unauthorized response"
    end
  end

  describe "GET #new" do
    context "as authorized user" do
      before(:each) do
        get :new, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
    end

    context "as unauthorized user" do
      before(:each) { get :new }

      include_examples "Validate unauthorized response"
    end
  end

  describe "GET #edit" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }

    context "as authorized user" do
      before(:each) do
        get :edit, params: { id: @idea.id }, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
    end

    context "as unauthorized user" do
      before(:each) { get :edit, params: { id: @idea.id } }

      include_examples "Validate unauthorized response"
    end
  end

  describe "POST #create" do
    context "as authorized user" do
      context "with valid attributes" do
        before(:each) do
          post :create, params: { idea: FactoryGirl.attributes_for(:idea) }, session: { user_id: @user.id }
        end

        it { is_expected.to respond_with :found }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to set_flash[:success].to('Idea created!') }
      end

      context "with invalid attributes" do
        before(:each) do
          post :create, params: { idea: FactoryGirl.attributes_for(:idea, :invalid) }, session: { user_id: @user.id }
        end

        it { is_expected.to respond_with :ok }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to set_flash.now[:danger].to('Idea could not be created.') }
      end
    end

    context "as unauthorized user" do
      before(:each) { post :create, params: { idea: FactoryGirl.attributes_for(:idea) } }

      include_examples "Validate unauthorized response"
    end
  end

  describe "PATCH #update" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }
    context "as authorized user" do
      context "with valid attributes" do
        before(:each) do
          patch :update, params: { id: @idea.id, idea: FactoryGirl.attributes_for(:idea) }, session: { user_id: @user.id }
        end

        it { is_expected.to respond_with :found }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to redirect_to(idea_path(@idea)) }
        it { is_expected.to set_flash[:success].to('Idea updated!') }
      end

      context "with invalid attributes" do
        before(:each) do
          patch :update, params: { id: @idea.id, idea: FactoryGirl.attributes_for(:idea, :invalid) }, session: { user_id: @user.id }
        end

        it { is_expected.to respond_with :ok }
        it { is_expected.to respond_with_content_type :html }
        it { is_expected.to set_flash.now[:danger].to('Idea could not be updated.') }
      end
    end

    context "as unauthorized user" do
      before(:each) { patch :update, params: { id: @idea.id, idea: FactoryGirl.attributes_for(:idea, :invalid) } }

      include_examples "Validate unauthorized response"
    end
  end

  describe "DELETE #destroy" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }
    context "as authorized user" do
      before(:each) do
        delete :destroy, params: { id: @idea.id }, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to redirect_to ideas_path }
      it { is_expected.to set_flash[:success].to('Idea deleted!') }
    end

    context "as unauthorized user" do
      before(:each) { delete :destroy, params: { id: @idea.id } }

      include_examples "Validate unauthorized response"
    end
  end
end