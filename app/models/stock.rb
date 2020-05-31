class Stock < ApplicationRecord
  validates :minimum,
            :maximum,
            presence: { message: Messages::ERRORS[:required_field] }

  validates :minimum,
            :maximum,
            numericality: { only_integer: true,
                            message: Messages::ERRORS[:invalid_format] }

  validate :check_level

  has_one :accessory
  has_one :clothing

  def check_level
    return unless self.minimum.present?
    return unless self.maximum.present?

    if (self.minimum > self.maximum)
      errors.add(:maximum, Messages::ERRORS[:incorrect_stock_value])
    end
  end
end
