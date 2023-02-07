require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before :each do
    @profile_pic = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @author = User.create(name: 'Mulugeta',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Mv Student')

    @first_post = Post.create(author: @author, title: 'Hello', text: 'This is my first post')
    @second_post = Post.create(author: @author, title: 'Second post',
                               text: 'This is my second post')

    @com1 = Comment.create(author: @author, post: @first_post, text: 'Great work')
    @com2 = Comment.create(author: @author, post: @second_post,
                           text: 'Hello there')
    @com3 = Comment.create(author: @author, post: @second_post, text: 'Cant wait read your next post')

    visit user_path(@author)

    click_link 'See all posts'
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@author.name)
  end
  it 'shows the user photo' do
    expect(page.body).to include(@profile_pic)
  end

  it 'shows number of posts user has written' do
    expect(page.body).to include('2')
  end

  it 'shows number of comments a post has' do
    expect(page.body).to include('3')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 0')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@second_post.title)
  end

  it 'shows part of a post body (This is my second post)' do
    expect(page).to have_content(@second_post.text)
  end

  it 'shows the comments on a post)' do
    expect(page).to have_content(@com1.text)
    expect(page).to have_content(@com2.text)
    expect(page).to have_content(@com3.text)
  end

  it 'to show the Pagination buttons' do
    expect(page).to have_content(' Prev 1 Next')
  end

  it 'Redirect to post show page when a post is clicked' do
    click_link @second_post.title
    expect(current_path).to match user_post_path(@author, @second_post.id)
  end
end
