Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "about/index"
  get "/devices",          to: "devices#index", as: :devices
  get "device/:id", to: "devices#show", as: :device

  resources :devices, only: [ :show, :index ]
  resource :cart, only: [ :show ], path: "/cart"

  get "up" => "rails/health#show", as: :rails_health_check

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
  # “Add a device to the cart”
  post   "/cart/:id", to: "carts#create",  as: :add_to_cart

  # “Remove a device from the cart”
  delete "/cart/:id", to: "carts#destroy", as: :remove_from_cart

  root "home#index"
end
