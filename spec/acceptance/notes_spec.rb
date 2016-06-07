require 'spec_helper'

describe "Notes" do
  let(:user) { FactoryGirl.create(:user) }
  include_examples "Login"
end