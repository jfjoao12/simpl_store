class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :initialize_session
  helper_method :cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  private

  def initialize_session
    session[:cart] ||= []
  end

  def cart
    Phone.find(session[:cart])
  end

  def configure_permitted_parameters
    # For sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :username, :street, :city, :state, :zip, :country
    ])
    # For account update
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :username, :street, :city, :state, :zip, :country
    ])
  end
end
