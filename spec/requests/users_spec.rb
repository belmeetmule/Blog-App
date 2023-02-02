require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get /' do
    it 'should render index' do
      get '/'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/'
      expect(response.body).to include('Users#index')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:id'
    end
  end
end
