class Inspiration < ApplicationRecord
  enum status: Statuses::INSPIRATIONS
end
