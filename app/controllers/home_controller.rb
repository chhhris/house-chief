class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to redirect_path
    end
  end

protected

  def redirect_path
    user_properties = current_user.properties
    user_properties.count != 1 ? properties_path : property_path(@property = user_properties.first)
  end

end