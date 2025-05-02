require "stripe"

Rails.configuration.stripe = {
  publishable_key: "pk_test_51QxZ27Jg23IgWzjaaaUtp91oxKSBFKglmvyoP0J9klxYJdHPrKE6xn0PXCAXOvMkmG4sy1AVwfeBSW26DLxdA6FV00XVZo0Y95",
  secret_key: "sk_test_51QxZ27Jg23IgWzjabmwlVzNpBGztnCR62v7eUNRnsKBpmjbXTNqR4mPRUd4K2KQAqJPGyZ1yEX3uJwGHuAGGWKur00gGgiz7DX"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
