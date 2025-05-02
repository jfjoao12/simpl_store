ActiveAdmin.register Phone do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :external_id, :brand_id, :name, :brand_name, :battery_type, :battery_charging, :platform_os, :platform_chipset, :platform_cpu, :platform_gpu, :network_technology, :network_speed, :network_2g, :network_3g, :network_4g, :network_5g, :display_type, :display_size, :display_resolution, :display_protection, :launch_announced, :launch_released, :launch_status, :body_dimensions, :body_weight, :body_build, :body_sim, :memory_card_slot, :memory_internal, :sound_audio_jack, :sound_loudspeaker, :comms_wlan, :comms_bluetooth, :comms_positioning, :comms_nfc, :comms_radio, :comms_usb, :features_sensors, :colors, :models, :cameras_main_type, :cameras_main_camera_specs, :cameras_main_features, :cameras_main_video, :cameras_selfie_type, :cameras_selfie_camera_specs, :cameras_selfie_features, :cameras_selfie_video
  #
  # or
  #
  # permit_params do
  #   permitted = [:external_id, :brand_id, :name, :brand_name, :battery_type, :battery_charging, :platform_os, :platform_chipset, :platform_cpu, :platform_gpu, :network_technology, :network_speed, :network_2g, :network_3g, :network_4g, :network_5g, :display_type, :display_size, :display_resolution, :display_protection, :launch_announced, :launch_released, :launch_status, :body_dimensions, :body_weight, :body_build, :body_sim, :memory_card_slot, :memory_internal, :sound_audio_jack, :sound_loudspeaker, :comms_wlan, :comms_bluetooth, :comms_positioning, :comms_nfc, :comms_radio, :comms_usb, :features_sensors, :colors, :models, :cameras_main_type, :cameras_main_camera_specs, :cameras_main_features, :cameras_main_video, :cameras_selfie_type, :cameras_selfie_camera_specs, :cameras_selfie_features, :cameras_selfie_video]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
