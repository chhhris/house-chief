class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options
    { host: Rails.env == 'development' ? 'localhost:3000' : 'housechief.com' }
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
  end

end
