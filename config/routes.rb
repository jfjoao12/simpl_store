Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  get "device/:id", to: "device#show", as: :device

  resources :devices, only: [ :show ]
  resource :cart, only: [ :show ]

  get "up" => "rails/health#show", as: :rails_health_check


  # add a device to cart
  post   "/cart/:id",   to: "carts#create",  as: :add_to_cart

  # remove a device from cart
  delete "/cart/:id",   to: "carts#destroy", as: :remove_from_cart

  root "home#index"
end
