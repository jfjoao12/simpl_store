require "stripe"

Rails.configuration.stripe = {
  publishable_key: ENV["PUBLIC_STRIPE_KEY"],
  secret_key: ENV["SECRET_STRIPE_KEY"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
