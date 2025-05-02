class ReAddbrandstable2 < ActiveRecord::Migration[8.0]
  def change
    ActiveRecord::Base.connection.drop_table(:brands)

    create_table :brands do |t|
      t.string :name
      t.timestamps
    end
  end
end
