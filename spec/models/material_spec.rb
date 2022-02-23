require 'rails_helper'

RSpec.describe Material, type: :model do
  it 'validates inheritance of Material and Cost' do
    expect(described_class).to be < Cost
  end
end
