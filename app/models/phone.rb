class Phone < ApplicationRecord
  belongs_to :brand
  has_many :devices, dependent: :destroy
  has_many :discounts, dependent: :destroy
  serialize :battery_charging, coder: YAML, type: Array
  serialize :network_2g,       coder: YAML, type: Array
  serialize :network_3g,       coder: YAML, type: Array
  serialize :network_4g,       coder: YAML, type: Array
  serialize :network_5g,       coder: YAML, type: Array

  serialize :colors,           coder: YAML, type: Array
  serialize :models,           coder: YAML, type: Array

  serialize :cameras_main_camera_specs,   coder: YAML, type: Array
  serialize :cameras_main_features,       coder: YAML, type: Array
  serialize :cameras_main_video,          coder: YAML, type: Array
  serialize :cameras_selfie_camera_specs, coder: YAML, type: Array
  serialize :cameras_selfie_features,     coder: YAML, type: Array
  serialize :cameras_selfie_video,        coder: YAML, type: Array

  def self.colors
    all.flat_map(&:colors).compact.uniq
  end

  ransacker :colors_cont, formatter: proc { |v|
  # returns a SQL fragment matching entries whose serialized text includes v
  "#{table_name}.colors LIKE '%#{v}%'"
  }, splat_param: true do |parent|
    parent.table[:colors]
  end

  # allow that new predicate
  def self.ransackable_attributes(auth_object = nil)
    super + [ "colors_cont" ]
  end
end
