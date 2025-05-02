class CreatePhoneColors < ActiveRecord::Migration[8.0]
  def change
    create_table :phone_colors do |t|
      t.references :phones, null: false, foreign_key: true
      t.text :colors

      t.timestamps
    end
  end
end
