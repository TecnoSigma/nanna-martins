class Gender < ApplicationRecord
  validates :kind,
            presence: { message: Messages::ERRORS[:required_field] }
end
