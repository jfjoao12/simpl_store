class CreateTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :types do |t|
      t.string :type
      t.timestamps
    end
  end
end
