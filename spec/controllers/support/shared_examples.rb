require 'spec_helper'

UNAUTHORIZED_ERROR = { error: "Access denied" }

shared_examples "Validate CRUD API" do |object|
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @objects = FactoryGirl.create_list(object, 3, idea_id: @idea.id)
    end

    context "as authorized user" do
      before(:each) do
        get :index, params: { idea_id: @idea.id }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(@objects.to_json).excluding('idea_id') }
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
      @object_attributes = FactoryGirl.attributes_for(object, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, object => @object_attributes }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :created }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @object_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, object => @object_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "PATCH #update" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @object = FactoryGirl.create(object, idea: @idea)
      @object_attributes = FactoryGirl.attributes_for(object, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        patch :update, params: { id: @object.id, idea_id: @idea.id, object => @object_attributes }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @object_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        patch :update, params: { id: @object.id, idea_id: @idea.id, object => @object_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "DELETE #destroy" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @object = FactoryGirl.create(object, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        delete :destroy, params: { id: @object.id, idea_id: @idea.id }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :no_content }
    end

    context "as unauthorized user" do
      before(:each) do
        delete :destroy, params: { id: @object.id, idea_id: @idea.id }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end
end