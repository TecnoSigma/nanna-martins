# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feedstock, type: :model do
  describe 'validates relationships' do
    it 'validates relationship N:1 between Feedstock and Stock' do
      feedstock = Feedstock.new

      expect(feedstock).to respond_to(:stock)
    end
  end
end
