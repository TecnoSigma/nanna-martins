class User < ApplicationRecord
  validates :email,
            :password,
            presence: { message: Messages.errors[:required_field] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
