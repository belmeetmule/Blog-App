require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe Users do
    before(:all) do
      Rails.application.load_seed
    end
  end
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
      get '/users/id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return show' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Users#show')
    end
  end
end
