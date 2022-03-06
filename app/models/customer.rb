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

  has_many :orders

  scope :ordered_by_name, -> { all.order(:name) }

  def full_address
    "#{self.address}, #{self.number} - #{self.complement} - #{self.district} - #{self.city} - " \
    "#{self.state} - #{self.postal_code}"
  end

  def pendent?
    self.status == 'pendent'
  end

  def activated?
    self.status == 'activated'
  end
end
