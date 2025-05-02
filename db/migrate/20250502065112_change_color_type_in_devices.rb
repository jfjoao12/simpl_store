class ChangeColorTypeInDevices < ActiveRecord::Migration[8.0]
  def up
    change_column :devices, :color, :string
  end
end
