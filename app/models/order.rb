class Order < ApplicationRecord
  validates :delivery_forecast,
            :freight,
            :final_payment,
            :down_payment,
            :quantity,
            presence: { message: Messages.errors[:required_field] }

  enum status: Statuses::ORDERS

  has_many :crafts
  belongs_to :customer
end
