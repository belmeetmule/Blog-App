require 'rails_helper'

RSpec.describe 'Get all posts routes', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:posts) { FactoryBot.create_list(:post, 20, author_id: user.id) }
  let(:user_id) { user.id }

  before { get "/api/v1/users/#{user.id}/posts" }

  it 'returns all posts' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end
