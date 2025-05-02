class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    session[:cart] ||= []
  end

  def cart
    Phone.find(session[:cart])
  end
end
