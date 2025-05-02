class DeviceController < ApplicationController
  def show
    @device = Device.includes(:phone, :type).find(params[:id])
  end
end
