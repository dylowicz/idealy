require 'spec_helper'

describe IdeasController, type: :controller do
  before(:all) do
    @authorized_user = FactoryGirl.create(:user)
    @unauthorized_user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:each) do
      session[:user_id] = @authorized_user.id
      get :index
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #show" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @authorized_user) }
    before(:each) do
      session[:user_id] = @authorized_user.id
      get :show, params: { id: @idea.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #new" do
    before(:each) do
      session[:user_id] = @authorized_user.id
      get :new
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "GET #edit" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @authorized_user) }
    before(:each) do
      session[:user_id] = @authorized_user.id
      get :edit, params: { id: @idea.id }
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
  end

  describe "POST #create" do
    context "with valid attributes" do
      before(:each) do
        session[:user_id] = @authorized_user.id
        post :create, params: { idea: FactoryGirl.attributes_for(:idea) }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
    end

    xcontext "with not valid attributes" do

    end
  end

  describe "PATCH #update" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @authorized_user) }

    context "with valid attributes" do
      before(:each) do
        session[:user_id] = @authorized_user.id
        patch :update, params: { id: @idea.id, idea: FactoryGirl.attributes_for(:idea) }
      end

      it { is_expected.to respond_with :found }
      it { is_expected.to respond_with_content_type :html }
    end

    xcontext "with not valid attributes" do

    end
  end

  describe "DELETE #destroy" do
    before(:all) { @idea = FactoryGirl.create(:idea, user: @authorized_user) }
    before(:each) do
      session[:user_id] = @authorized_user.id
      delete :destroy, params: { id: @idea.id }
    end

    it { is_expected.to respond_with :found }
    it { is_expected.to respond_with_content_type :html }
  end
end