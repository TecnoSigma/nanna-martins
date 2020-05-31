class Customer < ApplicationRecord
validates :forename,
          :surname,
          :email,
          :gender,
          :document,
          :address,
          :number,
          :district,
          :city,
          :state,
          :postal_code,
          :status,
          :password,
          presence: { message: Messages::ERRORS[:required_field] }

  has_one :offer_channel
  has_and_belongs_to_many :accessories
  has_and_belongs_to_many :clothings
end
