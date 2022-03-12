class Stock < ApplicationRecord
  validates :measurement_unit,
            :reference,
            :name,
            :price,
            :quantity,
            presence: { message: Messages.errors[:required_field] }

  enum status: Statuses::STOCKS

  has_and_belongs_to_many :providers
  has_many :feedstocks

  scope :ordered_by_name, -> { all.order(:name) }

  def total_price
    (self.price * self.quantity.to_f).round(2)
  end
end
