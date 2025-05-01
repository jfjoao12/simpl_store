class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.integer :external_id
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
    add_index :phones, :external_id
  end
end
