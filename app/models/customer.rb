class Customer < ApplicationRecord
  validates :name,
            :kind,
            :contact,
            :document,
            :address,
            :number,
            :district,
            :city,
            :state,
            :postal_code,
            :cellphone,
            :email,
            :status,
            presence: { message: Messages.errors[:required_fields] }
end
