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

  belongs_to :collection
  belongs_to :gender
  belongs_to :stock
  has_and_belongs_to_many :clothings
  has_and_belongs_to_many :customers
end
