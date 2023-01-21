require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(name: 'John', posts_counter: 0) }
  let(:post) do
    Post.create!(title: 'Post title', text: 'Post text', author: user, comments_counter: 0, likes_counter: 0)
  end
  let(:like) do
    Like.create!(author_id: user.id, post_id: post.id)
  end

  it 'is not valid without an author_id' do
    like.author_id = nil
    expect(like).to_not be_valid
  end

  it 'is not valid without a post_id' do
    like.post_id = nil
    expect(like).to_not be_valid
  end
end
