class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    ActiveRecord::Base.connection.drop_table(:phones)
    create_table :phones do |t|
      t.references :brand, null: false, foreign_key: true
      t.string     :name
      t.string     :brand_name

      t.string     :battery_type
      t.text       :battery_charging

      t.string     :platform_os
      t.string     :platform_chipset
      t.string     :platform_cpu
      t.string     :platform_gpu

      t.string     :network_technology
      t.string     :network_speed
      t.text       :network_2g
      t.text       :network_3g
      t.text       :network_4g
      t.text       :network_5g

      t.text       :colors
      t.text       :models
      t.text       :cameras_main_camera_specs
      t.text       :cameras_main_features
      t.text       :cameras_main_video
      t.text       :cameras_selfie_camera_specs
      t.text       :cameras_selfie_features
      t.text       :cameras_selfie_video

      t.timestamps
    end
  end
end
