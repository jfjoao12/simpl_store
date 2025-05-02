class AddDeviceIdToTypes < ActiveRecord::Migration[8.0]
  def change
    add_column :types, :device_id, :int
  end
end
