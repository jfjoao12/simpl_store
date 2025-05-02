class CheckoutController < ApplicationController
  # POST /checkout/create
  def create
    Rails.logger.debug ">> Checkout#create params: #{params.inspect}"

    ids     = Array(params[:product_ids]).map(&:to_i)
    devices = Device.includes(:phone).where(id: ids)

    if devices.empty?
      redirect_to root_path, alert: "Nothing to checkout"
      return
    end

    line_items = devices.map do |device|
      Rails.logger.info "Creating Stripe item for #{device.id}: price=#{device.price.inspect.to_i}"

      {
        price_data: {
          currency:     "cad",
          product_data: {
            name:        device.phone.name,
            description: "#{device.phone.brand_name} — #{device.storage}"
          },
          unit_amount:  (device.price * 100).to_i
        },
        quantity: 1
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      mode:                "payment",
      success_url:         checkout_success_url,
      cancel_url:          checkout_cancel_url,
      line_items:          line_items
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    # payment succeeded
  end

  def cancel
    # payment canceled
  end
end
