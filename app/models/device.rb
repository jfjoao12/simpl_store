class Device < ApplicationRecord
  belongs_to :phone
  belongs_to :brand
  has_many :phones
  belongs_to :type
  belongs_to :category

  belongs_to :phone
  belongs_to :category

  validates :phone_id, presence: true
  validates :category_id, presence: true
  validates :storage, presence: true, length: { maximum: 50 }
  validates :color, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :serial, presence: true

  # Tell Ransack these are the only associations you want to be filterable
  def self.ransackable_associations(auth_object = nil)
    [ "phone" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    # super returns the default set (id, created_at, etc),
    # so we just append any extra ones you need:
    super + [ "phone_id", "storage", "color", "price", "serial" ]
  end
end
