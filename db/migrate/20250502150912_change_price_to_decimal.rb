class ChangePriceToDecimal < ActiveRecord::Migration[8.0]
  def up
    change_column :devices, :price, :decimal
  end
end
