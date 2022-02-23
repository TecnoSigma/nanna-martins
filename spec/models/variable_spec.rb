require 'rails_helper'

RSpec.describe Variable, type: :model do
  it 'validates inheritance of Variable and Cost' do
    expect(described_class).to be < Cost
  end
end
