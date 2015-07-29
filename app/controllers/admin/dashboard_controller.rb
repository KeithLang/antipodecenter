class Admin::DashboardController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "antipodeadmin" && password == "Hy6767@@@1K"
    end
  end
end
