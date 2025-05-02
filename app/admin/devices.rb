# app/admin/devices.rb
ActiveAdmin.register Device do
  permit_params :brand_id, :phone_id, :storage, :colors, :price, :imei

  form do |f|
    f.semantic_errors

    f.inputs "Device Details" do
      # RIGHT: pass full AR objects
      f.input :phone_id,
        as: :nested_select,
        level_1: {
          attribute:  :brand_id,
          collection: Brand.order(:name).to_a   # <-- actual Brand instances
        },
        level_2: {
          attribute: :phone_id,
          collection: Phone.all
        },
        level_3: {
          attribute: :colors,
          collection:
        }

      f.input :storage
      f.input :price
      f.input :serial
    end

    f.actions
  end
end
