require 'rails_helper'

RSpec.describe Accessory, type: :model do
  it 'validates inheritance of Accessory and Craft' do
    expect(described_class).to be < Craft
  end
end
