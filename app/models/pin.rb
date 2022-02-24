class Pin < Inspiration
  validates :segment,
            :url,
            presence: { message: Messages.errors[:required_field] }
end
