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
end
