require 'spec_helper'
require_relative 'support/shared_examples'

describe TasksController, type: :controller do
  include_examples "Validate CRUD API", :task
end
