class AddColumnsToDevices < ActiveRecord::Migration[8.0]
  def change
    drop_table :devices, if_exists: true

    create_table :devices do |t|
      t.strinng :phone_id
      t.string :storage
      t.string :color
      t.string :price
      t.string :serial
      t.timestamps
    end
  end
end
