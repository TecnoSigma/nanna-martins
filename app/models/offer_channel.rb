class OfferChannel < ApplicationRecord
  validates :newsletter,
            :sms,
            :whatsapp,
            presence: { message: Messages::ERRORS[:required_field] }
end
