class ModifyBrandsTable < ActiveRecord::Migration[8.0]
  def change
    # drop the old table if it exists so you can rebuild it from scratch
    drop_table :phones, if_exists: true

    create_table :phones do |t|
      # your API’s “id”
      t.integer  :external_id, null: false, index: { unique: true }

      # Rails “belongs_to :brand”
      t.references :brand, null: false, foreign_key: true

      # top-level
      t.string  :name
      t.string  :brand_name

      # battery
      t.string  :battery_type
      t.text    :battery_charging

      # platform
      t.string  :platform_os
      t.string  :platform_chipset
      t.string  :platform_cpu
      t.string  :platform_gpu

      # network
      t.string  :network_technology
      t.string  :network_speed
      t.text    :network_2g
      t.text    :network_3g
      t.text    :network_4g
      t.text    :network_5g

      # display
      t.string  :display_type
      t.string  :display_size
      t.string  :display_resolution
      t.string  :display_protection

      # launch
      t.date    :launch_announced
      t.date    :launch_released
      t.string  :launch_status

      # body
      t.string  :body_dimensions
      t.string  :body_weight
      t.string  :body_build
      t.string  :body_sim

      # memory
      t.string  :memory_card_slot
      t.string  :memory_internal

      # sound
      t.string  :sound_audio_jack
      t.string  :sound_loudspeaker

      # comms
      t.string  :comms_wlan
      t.string  :comms_bluetooth
      t.string  :comms_positioning
      t.boolean :comms_nfc
      t.string  :comms_radio
      t.string  :comms_usb

      # features
      t.string  :features_sensors

      # simple arrays (serialize these or switch to JSON/text)
      t.text    :colors
      t.text    :models

      # cameras.mainCamera
      t.string  :cameras_main_type
      t.text    :cameras_main_camera_specs
      t.text    :cameras_main_features
      t.text    :cameras_main_video

      # cameras.selfieCamera
      t.string  :cameras_selfie_type
      t.text    :cameras_selfie_camera_specs
      t.text    :cameras_selfie_features
      t.text    :cameras_selfie_video

      t.timestamps
    end
  end
end
