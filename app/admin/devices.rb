ActiveAdmin.register Device do
  permit_params :brand_id, :phone_id, :storage, :color, :price, :imei, :name

  form do |f|
    f.semantic_errors

    f.inputs "Device Details" do
      # 1) Pick the brand
      f.input :brand,
              as: :select,
              collection: Brand.order(:name).pluck(:name, :id),
              prompt: "Select a brand…"

      # 2) Then search‐and‐select phones scoped to that brand
      f.input :id,
              as: :search_select,
              url:            admin_phones_path,
              fields:         [ :name ],
              display_name:   :name,
              minimum_input_length: 2,
              dependent:      :brand,      # ← watch the :brand select
              order_by:       "name_asc",
              input_html:     { style: "width: 100%" }

      f.input :storage
      f.input :color
      f.input :price
      f.input :serial
    end

    f.actions
  end
end
