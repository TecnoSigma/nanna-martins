class Provider < ApplicationRecord
  validates :name,
            :kind,
            :document,
            :telephone,
            presence: { message: Messages.errors[:required_field] }

  validates :document,
            format: { with: Regex.cpf, message: Messages.errors[:invalid_format] }

  validates :email,
            format: { with: Regex.email, message: Messages.errors[:invalid_format] }

  validates :telephone,
            format: { with: Regex.cellphone, message: Messages.errors[:invalid_format] }

  validates :postal_code,
            format: { with: Regex.postal_code, message: Messages.errors[:invalid_format] }

  enum status: Status::CUSTOMERS

  has_and_belongs_to_many :feedstocks
end
