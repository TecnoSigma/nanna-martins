# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reference do
  describe '#generate' do
    it "generates accessories reference with incremented value when already exist reference" do
      exclusivity = true
      segment = 'Acessórios'
      kind = 'pulseira'
      season = 'Primavera'
      year = 2022

      craft = FactoryBot.create(
        :craft,
        segment: segment,
        kind: kind,
        season: season,
        year: year,
        exclusivity: exclusivity
      )

      craft_params = { segment: segment,
                       kind: kind,
                       season: season,
                       year: year,
                       exclusivity: true }

      result = described_class.new(craft_params).generate

      expected_result = 'A-PUL2022PRU0002'

      expect(result).to eq(expected_result)
    end

    context 'when the craft is exclusive' do
      it "generates accessories reference created in Spring/2022 when pass craft informations" do
        kind = 'pulseira'
        season = 'Primavera'
        year = 2022

        craft_params = { segment: 'Acessórios',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: true }

        result = described_class.new(craft_params).generate

        expected_result = 'A-PUL2022PRU0001'

        expect(result).to eq(expected_result)
      end

      it "generates clothing reference created in Summer/1999 when pass craft informations" do
        kind = 'vestido'
        season = 'Verão'
        year = 1999

        craft_params = { segment: 'Vestuário',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: true }

        result = described_class.new(craft_params).generate

        expected_result = 'V-VES1999VEU0001'

        expect(result).to eq(expected_result)
      end

      it "generates decoration reference created in Autumn/2022 when pass craft informations" do
        kind = 'cortina'
        season = 'Outono'
        year = 2022

        craft_params = { segment: 'Decoração',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: true }

        result = described_class.new(craft_params).generate

        expected_result = 'D-COR2022OUU0001'

        expect(result).to eq(expected_result)
      end
    end

    context 'when the craft isn\'t exclusive' do
      it "generates accessories reference created in Spring/2022 when pass craft informations" do
        kind = 'pulseira'
        season = 'Primavera'
        year = 2022

        craft_params = { segment: 'Acessórios',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: false }

        result = described_class.new(craft_params).generate

        expected_result = 'A-PUL2022PRG0001'

        expect(result).to eq(expected_result)
      end

      it "generates clothing reference created in Summer/1999 when pass craft informations" do
        kind = 'vestido'
        season = 'Verão'
        year = 1999

        craft_params = { segment: 'Vestuário',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: false }

        result = described_class.new(craft_params).generate

        expected_result = 'V-VES1999VEG0001'

        expect(result).to eq(expected_result)
      end

      it "generates decoration reference created in Autumn/2022 when pass craft informations" do
        kind = 'cortina'
        season = 'Outono'
        year = 2022

        craft_params = { segment: 'Decoração',
                         kind: kind,
                         season: season,
                         year: year,
                         exclusivity: false }

        result = described_class.new(craft_params).generate

        expected_result = 'D-COR2022OUG0001'

        expect(result).to eq(expected_result)
      end
    end
  end
end
