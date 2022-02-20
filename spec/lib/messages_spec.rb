# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Messages do
  describe '.all_names' do
    describe '.errors' do
      it 'returns hash containing errors messages' do
        expected_result = { required_field: 'Preenchimento de campo obrigatório!',
                            invalid_quantity: 'Quantidade inválida!',
                            invalid_format: 'Formato inválido!' }

        expect(described_class.errors).to eq(expected_result)
      end
    end
  end
end
