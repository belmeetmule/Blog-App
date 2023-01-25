require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/:user_id/posts/'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      expect(response).to render_template(:index)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('This is the list of all POSTS.')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render show' do
      expect(response).to render_template(:show)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include("Here is a single post for a given user. You are in '/users/:user_id/posts/:id'")
    end
  end
end
