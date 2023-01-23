require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Andor', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'Rebel fighter from Kenari')
    @post = Post.new(author: @author, title: 'Post numero uno', text: 'This is the test post')

    @like = Like.create(author: @author, post: @post.id)
  end

  it 'can not update likes_counter since it\'s a private method' do
    expect(@like).to_not respond_to(:update_likes_counter)
  end

  it 'will have the Post\'s likes_counter through update_comments_counter ' do
    expect(@post.likes_counter).to eq 0
  end
end
