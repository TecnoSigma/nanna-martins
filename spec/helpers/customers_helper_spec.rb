# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersHelper, type: :helper do
  include ApplicationHelper

  describe '#change_color_status' do
    it 'returns color status to activated when customer is activated' do
      customer = FactoryBot.create(:customer, status: :activated)

      result = helper.change_color_status(customer)

      expected_result = 'status-activated'

      expect(result).to eq(expected_result)
    end

    it 'returns color status to deactivated when customer is deactivated' do
      customer = FactoryBot.create(:customer, status: :deactivated)

      result = helper.change_color_status(customer)

      expected_result = 'status-deactivated'

      expect(result).to eq(expected_result)
    end

    it 'no returns color status when customer is pendent' do
      customer = FactoryBot.create(:customer, status: :pendent)

      result = helper.change_color_status(customer)

      expected_result = ''

      expect(result).to eq(expected_result)
    end
  end
end
