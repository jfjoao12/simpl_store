class AddColumnsToDevices < ActiveRecord::Migration[8.0]
  def change
    drop_table :devices, if_exists: true

    create_table :devices do |t|
      t.integer :phone_id
      t.integer :storage_size
      t.string :color
      t.string :serial_number
      t.timestamps
    end
  end
end
