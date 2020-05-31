class Gender < ApplicationRecord
  validates :kind,
            presence: { message: Messages::ERRORS[:required_field] }

  has_many :accessories
  has_many :clothings
end
