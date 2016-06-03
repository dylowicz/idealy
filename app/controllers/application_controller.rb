class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login

  private
    def require_login
      unless logged_in?
        respond_to do |format|
          format.html { render file: "public/401", status: :unauthorized }
          format.json { render json: { error: 'Access denied' }, status: :unauthorized }
        end
      end
    end
end
