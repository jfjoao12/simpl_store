class RenameColumnFromTypes < ActiveRecord::Migration[8.0]
  def change
      rename_column :types, :type, :name
  end
end
