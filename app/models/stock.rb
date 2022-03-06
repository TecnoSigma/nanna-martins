class Stock < ApplicationRecord
  validates :measurement_unit,
            :name,
            :price,
            :quantity,
            presence: { message: Messages.errors[:required_field] }

  enum status: Statuses::STOCKS

  has_and_belongs_to_many :providers
  has_many :feedstocks
end
