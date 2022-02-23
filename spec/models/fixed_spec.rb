require 'rails_helper'

RSpec.describe Fixed, type: :model do
  it 'validates inheritance of Fixed and Cost' do
    expect(described_class).to be < Cost
  end
end
