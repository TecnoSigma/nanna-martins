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
            presence: { message: 'Preenchimento de campo obrigatório!' }
end
