# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Regex do
  describe '.cpf' do
    it 'checks valid CPF' do
      cpf = '123.456.789-00'

      expect(described_class.cpf).to match(cpf)
    end

    it 'checks invalid CPF' do
      cpf = '123.456.789'

      expect(described_class.cpf).not_to match(cpf)
    end
  end

  describe '.document' do
    it 'checks valid document' do
      cpf = '123.456.789-00'
      cnpj = '12.345.677/0001-33'

      expect(described_class.document).to match(cpf)
      expect(described_class.document).to match(cnpj)
    end

    it 'checks invalid document' do
      cpf = '123.456.789'
      cnpj = '12.345.677/00000-11'

      expect(described_class.document).not_to match(cpf)
      expect(described_class.document).not_to match(cnpj)
    end
  end

  describe '.email' do
    it 'checks valid email' do
      email = 'abc@teste.com.br'

      expect(described_class.email).to match(email)
    end

    it 'checks invalid email' do
      email = 'abc@@'

      expect(described_class.email).not_to match(email)
    end
  end

  describe '.postal_code' do
    it 'checks valid postal code' do
      postal_code = '05612-000'

      expect(described_class.postal_code).to match(postal_code)
    end

    it 'checks invalid postal code' do
      postal_code = '03331abc'

      expect(described_class.postal_code).not_to match(postal_code)
    end
  end

  describe '.telephone' do
    it 'checks valid telephone' do
      telephone = '(11) 1234 8888'

      expect(described_class.telephone).to match(telephone)
    end

    it 'checks invalid telephone' do
      telephone = '1234 8888'

      expect(described_class.telephone).not_to match(telephone)
    end
  end

  describe '.cellphone' do
    it 'checks valid cellphone' do
      cellphone = '(11) 9 1234 8888'

      expect(described_class.cellphone).to match(cellphone)
    end

    it 'checks invalid cellphone' do
      cellphone = '1234 8888'

      expect(described_class.cellphone).not_to match(cellphone)
    end
  end
end
