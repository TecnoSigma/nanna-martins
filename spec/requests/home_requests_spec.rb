#frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET actions' do
    describe '#index' do
      it 'renders home page' do
        get '/'

        expect(response).to render_template(:index)
      end
    end
  end
end
