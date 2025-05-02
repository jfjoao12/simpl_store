class Phone < ApplicationRecord
  belongs_to :brand

  serialize :battery_charging, coder: JSON, type: Array
  serialize :network_2g,       coder: JSON, type: Array
  serialize :network_3g,       coder: JSON, type: Array
  serialize :network_4g,       coder: JSON, type: Array
  serialize :network_5g,       coder: JSON, type: Array

  serialize :colors,           coder: JSON, type: Array
  serialize :models,           coder: JSON, type: Array

  serialize :cameras_main_camera_specs,   coder: JSON, type: Array
  serialize :cameras_main_features,       coder: JSON, type: Array
  serialize :cameras_main_video,          coder: JSON, type: Array
  serialize :cameras_selfie_camera_specs, coder: JSON, type: Array
  serialize :cameras_selfie_features,     coder: JSON, type: Array
  serialize :cameras_selfie_video,        coder: JSON, type: Array
end
