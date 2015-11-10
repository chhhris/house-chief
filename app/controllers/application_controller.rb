class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: Rails.env.production? ? 'www.housechief.com' : 'localhost' }
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
  end



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  def set_property
    resource    = params[:controller].classify.underscore.downcase.to_sym
    property_id = params.key?(:property_id) ? params[:property_id] : params[resource][:property_id]
    @property   = Property.find(property_id)
  end

end
