class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "binders", password: "women" if ENV["RAILS_ENV"] == "production"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
