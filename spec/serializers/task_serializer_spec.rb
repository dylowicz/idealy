require 'rails_helper'

describe TaskSerializer, type: :serializer do
  context "serialized resource" do
    let(:resource) { FactoryGirl.build(:task) }
    let(:serializer) { TaskSerializer.new(resource) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject { JSON.parse(serialization.to_json) }

    it "has an id" do
      expect(subject['id']).to eql(resource.id)
    end

    it "has a title" do
      expect(subject['title']).to eql(resource.title)
    end

    it "has completed status" do
      expect(subject['completed']).to eql(resource.completed?)
    end
  end
end