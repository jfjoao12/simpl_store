class AddTypeToDevices < ActiveRecord::Migration[8.0]
  def change
    # allow NULL for now so the migration can run
    add_reference :devices, :type, foreign_key: true, null: true
  end
end
