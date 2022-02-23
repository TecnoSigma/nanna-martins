require 'rails_helper'

RSpec.describe Clothing, type: :model do
  it 'validates inheritance of Clothing and Craft' do
    expect(described_class).to be < Craft
  end
end
