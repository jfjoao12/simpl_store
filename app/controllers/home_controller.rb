class HomeController < ApplicationController
  def index
    @offers = Device
                .joins(:type, :phone)                          # JOIN types and phones
                .where(types: { name: "Offer" })               # filter to Offer
                .includes(:phone)                              # eager‑load phone for the view

    @new_arrivals = Device
                      .joins(:type, :phone)
                      .where("devices.created_at >= ?", 10.hours.ago)
                      .order("devices.created_at DESC")


    @featured = Device
                  .joins(:type, :phone)
                  .where(types: { name: "Featured" })
                  .includes(:phone)
  end
end
