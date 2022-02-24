class Feedstock < Cost
  validates :measurement_unit,
            :name,
            presence: { message: Messages.errors[:required_field] }

  enum status: Statuses::FEEDSTOCKS

  has_and_belongs_to_many :providers
end
