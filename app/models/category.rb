class Category < ApplicationRecord
  has_many :devices, dependent: :restrict_with_exception
  validates :name, presence: true, uniqueness: true
end
