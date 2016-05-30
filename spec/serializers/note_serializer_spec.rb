require 'spec_helper'

describe NoteSerializer, type: :serializer do
  let(:resource) { FactoryGirl.build(:note) }
  let(:serializer) { NoteSerializer.new(resource) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  subject { JSON.parse(serialization.to_json) }

  it "has an id" do
    expect(subject['id']).to eql(resource.id)
  end

  it "has a content" do
    expect(subject['content']).to eql(resource.content)
  end

  it "has date of creation" do
    expect(subject['created_at']).to eql(resource.created_at)
  end
end