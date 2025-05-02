class Device < ApplicationRecord
  belongs_to :phone


  # Tell Ransack these are the only associations you want to be filterable
  def self.ransackable_associations(auth_object = nil)
    [ "phone" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    # super returns the default set (id, created_at, etc),
    # so we just append any extra ones you need:
    super + [ "phone_id", "storage", "color", "price", "imei" ]
  end
end
