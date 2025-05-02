Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  get "device/:id", to: "device#show", as: :device

  resources :devices, only: [ :show ]

  get "up" => "rails/health#show", as: :rails_health_check


  resource :cart, only: [ :show ], path: "/cart"

  # “Add a device to the cart”
  post   "/cart/:id", to: "carts#create",  as: :add_to_cart

  # “Remove a device from the cart”
  delete "/cart/:id", to: "carts#destroy", as: :remove_from_cart

  root "home#index"
end
