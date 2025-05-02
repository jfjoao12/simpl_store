class AddCategoryToDevices < ActiveRecord::Migration[8.0]
  def change
    add_reference :devices, :category, null: false, foreign_key: true
  end
end
