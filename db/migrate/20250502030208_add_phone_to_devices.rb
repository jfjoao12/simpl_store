class AddPhoneToDevices < ActiveRecord::Migration[8.0]
  def change
    add_reference :devices, :phone, null: false, foreign_key: true
  end
end
