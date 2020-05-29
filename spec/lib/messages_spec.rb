require 'rails_helper'

RSpec.describe Messages do
  it 'returns errors list' do
    expected_result = { required_field: 'Preenchimento de campo obrigatório!',
                        invalid_format: 'Formato inválido!',
                        already_field: 'Registro existente!',
                        incorrect_stock_value: 'Valor máximo não pode ser maior que o valor mínimo!' }

    expect(described_class::ERRORS).to eq(expected_result)
  end
end
