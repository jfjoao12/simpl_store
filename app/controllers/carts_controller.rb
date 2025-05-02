class CartsController < ApplicationController
  before_action :get_device, only: [ :create, :destroy ]

  def create
    session[:cart] ||= []
    unless session[:cart].include?(@device.id)
      session[:cart] << @device.id
      flash[:notice] = "#{@device.phone.name} was added to the cart."
    end
    redirect_to root_path
  end

  def destroy
    session[:cart] ||= []
    if session[:cart].delete(@device.id)
      flash[:notice] = "#{@device.phone.name} was removed from the cart."
    end
    redirect_back(fallback_location: cart_path)
  end

  def show
    @items = Device.includes(:phone).where(id: session[:cart] || [])
  end

  private

  def get_device
    @device = Device.find(params[:id])
  end
end
