class Inspiration < ApplicationRecord
  enum status: Statuses::INSPIRATIONS

  has_and_belongs_to_many :crafts

  ALLOWED_KINDS = %w(instagram youtube)
end
