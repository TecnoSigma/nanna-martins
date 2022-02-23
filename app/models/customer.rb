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
            presence: { message: Messages.errors[:required_field] }

  validates :document,
            format: { with: Regex.cpf, message: Messages.errors[:invalid_format] }

  validates :email,
            format: { with: Regex.email, message: Messages.errors[:invalid_format] }

  validates :cellphone,
            format: { with: Regex.cellphone, message: Messages.errors[:invalid_format] }

  validates :postal_code,
            format: { with: Regex.postal_code, message: Messages.errors[:invalid_format] }

  enum status: Statuses::CUSTOMERS
end
