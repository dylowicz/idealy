require 'spec_helper'

UNAUTHORIZED_ERROR = { error: "Access denied" }

describe TasksController, type: :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @tasks = FactoryGirl.create_list(:task, 3, idea_id: @idea.id)
    end

    context "as authorized user" do
      before(:each) do
        get :index, params: { idea_id: @idea.id }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(@tasks.to_json).excluding('idea_id') }
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
      @task_attributes = FactoryGirl.attributes_for(:task, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, task: @task_attributes }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :created }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @task_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        post :create, params: { idea_id: @idea.id, task: @task_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "PATCH #update" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @task = FactoryGirl.create(:task, idea: @idea)
      @task_attributes = FactoryGirl.attributes_for(:task, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        patch :update, params: { id: @task.id, idea_id: @idea.id, task: @task_attributes }, session: { user_id: @user.id },  xhr: true
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql @task_attributes.to_json }
    end

    context "as unauthorized user" do
      before(:each) do
        patch :update, params: { id: @task.id, idea_id: @idea.id, task: @task_attributes }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end

  describe "DELETE #destroy" do
    before(:all) do
      @idea = FactoryGirl.create(:idea, user: @user)
      @task = FactoryGirl.create(:task, idea: @idea)
    end

    context "as authorized user" do
      before(:each) do
        delete :destroy, params: { id: @task.id, idea_id: @idea.id }, session: { user_id: @user.id }, xhr: true
      end

      it { is_expected.to respond_with :no_content }
    end

    context "as unauthorized user" do
      before(:each) do
        delete :destroy, params: { id: @task.id, idea_id: @idea.id }, xhr: true, format: :json
      end

      it { is_expected.to respond_with :unauthorized }
      it { is_expected.to respond_with_content_type :json }
      it { expect(response.body).to be_json_eql(UNAUTHORIZED_ERROR.to_json) }
    end
  end
end
