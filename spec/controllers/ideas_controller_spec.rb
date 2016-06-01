require 'spec_helper'

describe IdeasController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:each) do
      get :index, session: { user_id: @user.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #show" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }
    before(:each) do
      get :show, params: { id: @idea.id }, session: { user_id: @user.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #new" do
    before(:each) do
      get :new, session: { user_id: @user.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #edit" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }
    before(:each) do
      get :edit, params: { id: @idea.id }, session: { user_id: @user.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:each) do
        post :create, params: { idea: FactoryGirl.attributes_for(:idea) }, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to set_flash[:success].to('Idea created!') }
    end

    xcontext "with not valid attributes" do

    end
  end

  describe "PATCH #update" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }

    context "with valid attributes" do
      before(:each) do
        patch :update, params: { id: @idea.id, idea: FactoryGirl.attributes_for(:idea) }, session: { user_id: @user.id }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to set_flash[:success].to('Idea updated!') }
    end

    xcontext "with not valid attributes" do

    end
  end

  describe "DELETE #destroy" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @user) }
    before(:each) do
      delete :destroy, params: { id: @idea.id }, session: { user_id: @user.id }
    end

    it { is_expected.to respond_with :found }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to set_flash[:success].to('Idea deleted!') }
  end
end