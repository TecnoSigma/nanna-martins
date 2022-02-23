# frozen_string_literal: true

class Cost < ApplicationRecord
  validates :quantity,
            :description,
            :periodicity,
            :price,
            presence: { message: Messages.errors[:required_field] }

  belongs_to :craft
end
