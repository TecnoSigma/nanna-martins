require 'rails_helper'

RSpec.describe Messages do
  it 'returns errors list' do
    expected_result = { required_field: 'Preenchimento de campo obrigatório!' }

    expect(described_class::ERRORS).to eq(expected_result)
  end
end
