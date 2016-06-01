require 'spec_helper'

describe NotesController,  type: :controller do
  before(:all) do
    @authorized_user = FactoryGirl.create(:user)
    @unauthorized_user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @authorized_user)
      @notes = FactoryGirl.create_list(:note, 3, idea_id: @idea.id)
    end

    before(:each) do
      session[:user_id] = @authorized_user.id
      get :index, params: { idea_id: @idea.id }, xhr: true
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :json }
    it { expect(response.body).to be_json_eql(@notes.to_json).excluding('idea_id') }
  end

  describe "POST #create" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @authorized_user)
    end

    before(:each) do
      session[:user_id] = @authorized_user.id
      @note_attributes = FactoryGirl.attributes_for(:note, idea: @idea)
      post :create, params: { idea_id: @idea.id, note: @note_attributes }, xhr: true
    end

    it { is_expected.to respond_with :created }
    it { is_expected.to respond_with_content_type :json }
    it { expect(response.body).to be_json_eql @note_attributes.to_json }
  end

  describe "PATCH #update" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @authorized_user)
      @note = FactoryGirl.create(:note, idea: @idea)
    end

    before(:each) do
      session[:user_id] = @authorized_user.id
      @note_attributes = FactoryGirl.attributes_for(:note, idea: @idea)
      patch :update, params: { id: @note.id, idea_id: @idea.id, note: @note_attributes }, xhr: true
    end

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :json }
    it { expect(response.body).to be_json_eql @note_attributes.to_json }
  end

  describe "DELETE #destroy" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @authorized_user)
      @note = FactoryGirl.create(:note, idea: @idea)
    end

    before(:each) do
      session[:user_id] = @authorized_user.id
      delete :destroy, params: { id: @note.id, idea_id: @idea.id }, xhr: true
    end

    it { is_expected.to respond_with :no_content }
  end
end
