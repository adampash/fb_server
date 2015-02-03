class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV["basic_name"], password: ENV["basic_password"] if ENV["RAILS_ENV"] == "production"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
