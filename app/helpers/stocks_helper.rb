# frozen_string_literal: true

module StocksHelper
  def convert_to_currency(value)
    number_to_currency(value, unit: "R$ ", separator: ",", delimiter: ".")
  end
end
