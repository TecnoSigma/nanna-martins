class Collection < ApplicationRecord
  validates :name,
            :station,
            :status,
            :year,
            presence: { message: Messages::ERRORS[:required_field] }

  validates :year,
            numericality: { only_integer: true,
                            message: Messages::ERRORS[:invalid_format] }
end
