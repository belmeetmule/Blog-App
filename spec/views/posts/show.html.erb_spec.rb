require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before :each do
    @profile_pic = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @author = User.create(name: 'Mulugeta',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Mv Student')

    @first_post = Post.create(author: @author, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @author, title: 'Second post',
                               text: 'This is my second post')

    @com1 = Comment.create(author: @author, post: @first_post, text: 'Great work')
    @com2 = Comment.create(author: @author, post: @first_post,
                           text: 'Hello there')
    @com3 = Comment.create(author: @author, post: @first_post, text: 'Cant wait to read your next post')

    @like1 = @first_post.likes.create!(author: @author)

    visit user_post_path(@author, @first_post)
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end

  it 'shows number of comments the post has' do
    expect(page.body).to include('Comments: 3')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 1')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@first_post.title)
  end

  it 'shows part of a post body (This is my first post)' do
    expect(page).to have_content(@first_post.text)
  end

  it 'shows the comments on the post users left like(I cant wait to read your next post)' do
    expect(page).to have_content(@com1.text)
    expect(page).to have_content(@com2.text)
    expect(page).to have_content(@com3.text)
  end

  it 'shows the user name of a comment' do
    expect(page).to have_content(@com1.author.name)
    expect(page).to have_content(@com2.author.name)
    expect(page).to have_content(@com3.author.name)
  end

  it 'not to show the Pagination buttons' do
    expect(page).not_to have_content('Prev 1 Next')
  end
end
