class HomeController < ApplicationController
  skip_before_action :require_login
  include SessionsHelper

  def index
    redirect_to ideas_path if logged_in?
  end
end
