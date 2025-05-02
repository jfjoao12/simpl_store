# app/admin/brands.rb
ActiveAdmin.register Brand do
  permit_params :name
end
