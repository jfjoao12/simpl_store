class ReAddBrandsTable < ActiveRecord::Migration[8.0]
  def change
    ActiveRecord::Base.connection.drop_table(:brands)

    create_table :brands do |t|
      t.integer :name

      t.timestamps
    end
  end
end
