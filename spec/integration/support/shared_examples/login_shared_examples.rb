require 'spec_helper'

shared_examples "Login" do |email, password|
  before(:all) do
    visit(LoginPage)
  end

  it "logs in a user" do
    on(LoginPage).login(email, password)
    expect
  end
end

shared_examples "Sign Up" do |name, email, password|
  before(:all) do
    binding.pry
    visit(SignUpPage)
  end

  it "goes to sign up page" do
    
  end

  it "signs up user" do
    on(SignUpPage).signup(name, email, password)
    # expect()
  end
end
