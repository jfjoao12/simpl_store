class Phone < ApplicationRecord
  belongs_to :brands

  serialize :battery_charging, Array
  serialize :network_2g,       Array
  serialize :network_3g,       Array
  serialize :network_4g,       Array
  serialize :network_5g,       Array

  serialize :colors,           Array
  serialize :models,           Array

  serialize :cameras_main_camera_specs,   Array
  serialize :cameras_main_features,       Array
  serialize :cameras_main_video,          Array
  serialize :cameras_selfie_camera_specs, Array
  serialize :cameras_selfie_features,     Array
  serialize :cameras_selfie_video,        Array
end
