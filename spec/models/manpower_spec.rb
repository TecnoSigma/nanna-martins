require 'rails_helper'

RSpec.describe Manpower, type: :model do
  it 'validates inheritance of Manpower and Cost' do
    expect(described_class).to be < Cost
  end
end
