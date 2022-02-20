class Craft < ApplicationRecord
  validates :code,
            presence: { message: Messages.errors[:required_fields] }
end
