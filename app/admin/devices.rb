ActiveAdmin.register Device do
  permit_params :phone_id, :storage, :color, :price, :imei

  # Filters
  filter :phone, collection: proc { Phone.order(:name) }
  filter :storage
  filter :color
  filter :price

  # Index
  index do
    selectable_column
    id_column
    column :phone
    column :storage
    column :color
    column :price
    column :imei
    actions
  end

  # Show
  show do
    attributes_table do
      row :phone
      row :storage
      row :color
      row :price
      row :imei
      row :created_at
      row :updated_at
    end
  end

  # Form
  form do |f|
       f.semantic_errors

    f.inputs "Device Details" do
      f.input :phone,
              as: :select,
              collection: Phone.order(:name),
              prompt: "Select a phone…"
      f.input :storage
      f.input :color
      f.input :price
      f.input :serial
    end

    f.actions
  end
end
