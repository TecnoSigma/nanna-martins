require 'rails_helper'                                                                                                                                                                    

RSpec.describe HomeController, type: :controller do
  describe 'GET actions' do
    describe '#index' do
      it 'returns http status code 200' do
        get :index

        expect(response).to have_http_status(200)
      end
    end
  end
end
