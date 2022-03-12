# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StocksHelper, type: :helper do
  include ApplicationHelper

  describe '#convert_to_currency' do
    it 'converts number to currency' do
      value = 30

      expected_result = 'R$ 30,00'

      result = helper.convert_to_currency(value)

      expect(result).to eq(expected_result)
    end
  end
end
