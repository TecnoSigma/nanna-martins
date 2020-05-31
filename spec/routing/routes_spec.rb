require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  context 'HomeController' do
    context 'GET actions' do
      it { expect(get('/')).to route_to('home#index') }
    end 
  end
end
