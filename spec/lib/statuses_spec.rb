# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statuses do
  it 'returns customer statuses' do
    result = described_class::CUSTOMERS

    expected_result = { pendent: 0, activated: 1, deactivated: 2 }

    expect(result).to eq(expected_result)
  end

  it 'returns feedstock statuses' do
    result = described_class::FEEDSTOCKS

    expected_result = { pendent: 0, activated: 1, deactivated: 2 }

    expect(result).to eq(expected_result)
  end

  it 'returns feedstock statuses' do
    result = described_class::STOCKS

    expected_result = { pendent: 0, activated: 1, deactivated: 2 }

    expect(result).to eq(expected_result)
 end

  it 'returns provider statuses' do
    result = described_class::PROVIDERS

    expected_result = { pendent: 0, activated: 1, deactivated: 2 }

    expect(result).to eq(expected_result)
  end

  it 'returns order statuses' do
    result = described_class::ORDERS

    expected_result = { pendent: 0, activated: 1, deactivated: 2, delivered: 3, cancelled: 4 }

    expect(result).to eq(expected_result)
  end

  it 'returns inspiration statuses' do
    result = described_class::INSPIRATIONS

    expected_result = { pendent: 0, activated: 1, deactivated: 2 }

    expect(result).to eq(expected_result)
  end
end
