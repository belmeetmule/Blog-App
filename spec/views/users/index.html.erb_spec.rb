require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @author = User.create(name: 'Mulugeta M.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Mv Student')
    visit users_path
  end
  it 'shows user name' do
    expect(page).to have_content(@author.name)
  end
  it 'shows the user photo' do
    image = page.all('img')
    expect(image.size).to eq 1
  end
  it 'shows number of posts user has written' do
    expect(page.body).to include('0')
  end
  it 'redirects to user show page when a user is clicked' do
    click_link @author.name
    expect(current_path).to match user_path(@author)
  end
end
