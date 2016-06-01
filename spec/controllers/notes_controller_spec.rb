require 'spec_helper'

UNAUTHORIZED_ERROR = { error: "Access denied" }

describe NotesController,  type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @notes = FactoryGirl.create_list(:note, 3, idea_id: @idea.id)
    end

    context "as authorized user" do
      before(:each) do
        get :index, params: { idea_id: @idea.id }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(@notes.to_json).excluding('idea_id') }
    end

    context "as unauthorized user" do
      before(:each) do
        get :index, params: { idea_id: @idea.id }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end


  describe "POST #create" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @note_attributes = FactoryGirl.attributes_for(:note, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, note: @note_attributes }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :created }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @note_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, note: @note_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "PATCH #update" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @note = FactoryGirl.create(:note, idea: @idea)
      @note_attributes = FactoryGirl.attributes_for(:note, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        patch :update, params: { id: @note.id, idea_id: @idea.id, note: @note_attributes }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @note_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        patch :update, params: { id: @note.id, idea_id: @idea.id, note: @note_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "DELETE #destroy" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @note = FactoryGirl.create(:note, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        delete :destroy, params: { id: @note.id, idea_id: @idea.id }, session: { user_id: @user.id },  xhr: true
      end

      it { is_expected.to respond_with :no_content }
    end

    context "as unauthorized user" do
      before(:each) do
        delete :destroy, params: { id: @note.id, idea_id: @idea.id }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end
end
