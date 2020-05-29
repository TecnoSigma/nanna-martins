class Accessory < ApplicationRecord
  validates :reference,
            :name,
            :history,
            :kind,
            :feature,
            :description,
            :status,
            :size,
            :complement,
            :amount,
            presence: { message: Messages::ERRORS[:required_field] }

  validates :reference,
            uniqueness: { message: Messages::ERRORS[:already_field] }

  validates :amount,
            numericality: { only_integer: true,
                            message: Messages::ERRORS[:invalid_format] }
end
