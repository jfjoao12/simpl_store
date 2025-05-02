class AddCategoryToDevices < ActiveRecord::Migration[8.0]
  def change
    add_reference :devices, :category, null: true, foreign_key: true
  end
end
