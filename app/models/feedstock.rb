class Feedstock < Cost
  enum status: Statuses::FEEDSTOCKS

  belongs_to :stock
end
