class DeviceController < ApplicationController
  def show
    @device = Device.find(params: [ :id ])
              .joins(:type, :phone)
              .includes(:phone)
  end
end
