require 'rails_helper'

RSpec.describe Inspiration, type: :model do
  it 'validates relationship N:N between Inspirations and Crafts' do
    inspiration = Inspiration.new

    expect(inspiration).to respond_to(:crafts)
  end
end
