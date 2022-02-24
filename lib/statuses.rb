# frozen_string_literal: true

module Statuses
  CUSTOMERS = { pendent: 0, activated: 1, deactivated: 2 }.freeze
  FEEDSTOCKS = { pendent: 0, activated: 1, deactivated: 2 }.freeze
  PROVIDERS = { pendent: 0, activated: 1, deactivated: 2 }.freeze
  ORDERS = { pendent: 0, activated: 1, deactivated: 2, delivered: 3, cancelled: 4 }.freeze
  INSPIRATIONS = { pendent: 0, activated: 1, deactivated: 2 }.freeze
end
