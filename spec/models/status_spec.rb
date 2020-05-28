require 'rails_helper'

RSpec.describe Status do
  it 'returns status list' do
    expected_result = { activated: 'Ativo' }

    expect(described_class::STATUSES).to eq(expected_result)
  end
end
