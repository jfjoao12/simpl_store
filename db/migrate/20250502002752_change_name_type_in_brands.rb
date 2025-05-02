class ChangeNameTypeInBrands < ActiveRecord::Migration[8.0]
  def up
    change_column :brands, :name, :string
  end

  def down
    change_column :brands, :name, :integer
  end
end
