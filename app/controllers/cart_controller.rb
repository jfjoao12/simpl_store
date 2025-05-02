class CartController < ApplicationController
  before_action :get_product, only: [ :create, :destroy ]

  def create
    unless session[:cart].include?(@phone.id)
      session[:cart] << @phone.id
      flash[:notice] = "#{@phone.name} was added to the cart."
    end

    redirect_to root_path
  end

  def destroy
    if session[:cart].include?(@phone.id)
      session[:cart].delete(@phone.id)
      flash[:notice] = "#{@phone.name} was removed form the cart."
    end

    redirect_to root_path
  end

  private

  def get_phone
    phone_id = params[:id].to_i
    @phone = Phone.find(phone_id)
  end
end
