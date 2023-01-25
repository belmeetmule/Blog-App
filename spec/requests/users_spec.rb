require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'should render index' do
    get '/'
    expect(response).to render_template(:index)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/'
      expect(response.body).to include("The list of all users can be found at '/' or 'users/'")
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return show' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include("An individual user whose id is in the url. You are at '/user/:id'")
    end
  end
end
