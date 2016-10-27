class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_locations

  def get_locations
    @locations = Company.all.map(&:city) #for some reason pluck was returning a symbol into integer error
  end
end
