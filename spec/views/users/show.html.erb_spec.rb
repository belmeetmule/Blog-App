require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before :each do
    @author = User.create(name: 'Mulugeta',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Mv Student')
    @post1 = Post.create(author: @author, title: 'Hello',
                         text: 'This is my first post')
    @post2 = Post.create(author: @author, title: 'Second post', text: 'This is my second post')
    @post3 = Post.create(author: @author, title: 'Third post',
                         text: 'This is the third post')
    @post4 = Post.create(author: @author, title: 'Fourt post', text: 'The fourth post')
    visit user_path(@author)
  end
  it 'shows user name' do
    expect(page).to have_content(@author.name)
  end
  it 'shows user biography' do
    expect(page.body).to have_content(@author.bio)
  end
  it 'shows only the users recent 3 posts' do
    expect(page).to have_content(@post4.text)
    expect(page).to have_content(@post3.text)
    expect(page).to have_content(@post2.text)
    expect(page).not_to have_content(@post1.text)
  end
  it 'shows the user photo' do
    image = page.all('img')
    expect(image.size).to eq 1
  end
  it 'shows number of posts by the author' do
    expect(page.body).to include('4')
  end
  it 'shows the See all posts button' do
    expect(page).to have_content('See all posts')
  end
  it 'shows the New Post button' do
    expect(page).to have_content('New post')
  end
  it 'redirects to post show page when the post is clicked' do
    click_link @post4.title
    expect(current_path).to match user_post_path(@author, @post4)
  end
  it 'redirects to show all user posts when the \'See all posts\' button is clicked' do
    click_link 'See all posts'
    expect(current_path).to match user_posts_path(@author)
  end
  it 'redirects to post new page when a \'New post\' button is clicked' do
    click_link 'New post'
    expect(current_path).to match new_user_post_path(@author)
  end
end