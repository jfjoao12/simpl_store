# app/admin/devices.rb
ActiveAdmin.register Device do
  permit_params :brand_id, :phone_id, :storage, :color, :price, :serial, :type_id, :category_id
  filter :brand
  filter :phone
  filter :storage
  filter :price
  filter :type_id

  form do |f|
    f.semantic_errors
    f.inputs "Device Details" do
      f.input :phone_id,
        as: :nested_select,
        level_1: {
          attribute:  :brand_id,
          collection: Brand.order(:name).to_a   # <-- actual Brand instances
        },
        level_2: {
          attribute: :phone_id,
          collection: Phone.all
        }

      f.input :color, as: :string
      f.input :storage
      f.input :price
      f.input :serial
      f.input :type_id,
          as: :select,
          collection: Type.order(:name).pluck(:name, :id),
          prompt: "Select a type"
      f.input :category,  as: :select, collection: Category.order(:name)
    end

    f.actions
  end
end
