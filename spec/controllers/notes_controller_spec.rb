require 'spec_helper'
require_relative 'support/shared_examples'

describe NotesController, type: :controller do
  include_examples "Validate CRUD API", :note
end