class Craft < ApplicationRecord
  validates :description,
            :quantity,
            :season,
            :year,
            :exclusivity,
            presence: { message: Messages.errors[:required_field] }

  validate :check_allowed_quantity

  has_many :costs
  has_and_belongs_to_many :feedstocks
  has_and_belongs_to_many :inspirations
  belongs_to :order, optional: true

  def check_allowed_quantity
    return unless self.quantity

    if self.exclusivity && self.quantity > 1
      errors.add(:quantity, Messages.errors[:invalid_quantity])
    end
  end
end
