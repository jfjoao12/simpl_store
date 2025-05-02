class HomeController < ApplicationController
  def index
    @offers = Device
                .joins(:type, :phone)                          # JOIN types and phones
                .where(types: { name: "Offer" })               # filter to Offer
                .includes(:phone)                              # eager‑load phone for the view

    @new_arrivals = Device
                      .joins(:type, :phone)
                      .where(types: { name: "Normal" })
                      .includes(:phone)

    @featured = Device
                  .joins(:type, :phone)
                  .where(types: { name: "Featured" })
                  .includes(:phone)
  end
end
