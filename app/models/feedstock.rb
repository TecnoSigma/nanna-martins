class Feedstock < ApplicationRecord
  validates :measurement_unit,
            :name,
            :quantity,
            :description,
            presence: { message: Messages.errors[:required_field] }

  has_and_belongs_to_many :providers
end
