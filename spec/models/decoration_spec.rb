require 'rails_helper'

RSpec.describe Decoration, type: :model do
  it 'validates inheritance of Decoration and Craft' do
    expect(described_class).to be < Craft
  end
end
