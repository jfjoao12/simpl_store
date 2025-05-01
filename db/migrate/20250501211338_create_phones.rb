class CreatePhones < ActiveRecord::Migration[8.0]
  def change
    create_table :phones do |t|
      t.references :brands, null: false, foreign_key: true
      t.integer :external_id
      t.string :name
      t.integer :brand_id
      t.string :brand_name
      t.string :battery_type
      t.text :battery_charging, size: :array
      t.string :platform_os
      t.string :platform_chipset
      t.string :platform_cpu
      t.string :platform_gpu
      t.string :network_technology
      t.string :network_speed
      t.text :network_2g, size: :array
      t.text :network_3g, size: :array
      t.text :network_4g, size: :array
      t.text :network_5g, size: :array
      t.string :display_type
      t.string :display_size
      t.string :display_resolution
      t.string :display_protection
      t.date :launch_announced
      t.date :launch_released
      t.string :launch_status
      t.string :body_dimensions
      t.string :body_weight
      t.string :body_build
      t.string :body_sim
      t.string :memory_card_slot
      t.string :memory_internal
      t.string :sound_audio_jack
      t.string :sound_loudspeaker
      t.string :comms_wlan
      t.string :comms_bluetooth
      t.string :comms_positioning
      t.boolean :comms_nfc
      t.string :comms_radio
      t.string :comms_usb
      t.string :features_sensors
      t.text :colors, size: :array
      t.text :models, size: :array
      t.string :cameras_main_type
      t.text :cameras_main_camera_specs, size: :array
      t.text :cameras_main_features, size: :array
      t.text :cameras_main_video, size: :array
      t.string :cameras_selfie_type
      t.text :cameras_selfie_camera_specs, size: :array
      t.text :cameras_selfie_features, size: :array
      t.text :cameras_selfie_video, size: :array

      t.timestamps
    end
    add_index :phones, :external_id
  end
end
