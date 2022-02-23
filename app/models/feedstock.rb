class Feedstock < ApplicationRecord
  validates :measurement_unit,
            :name,
            :quantity,
            :description,
            presence: { message: Messages.errors[:required_field] }

  enum status: Statuses::FEEDSTOCKS

  has_and_belongs_to_many :providers
  has_and_belongs_to_many :crafts
end
