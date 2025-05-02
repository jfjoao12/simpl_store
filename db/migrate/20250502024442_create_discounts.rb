class CreateDiscounts < ActiveRecord::Migration[8.0]
  def change
    create_table :discounts do |t|
      t.references :device, null: false, foreign_key: true
      t.integer :discounted_percentage
      t.decimal :discounted_price
      t.boolean :active

      t.timestamps
    end
  end
end
