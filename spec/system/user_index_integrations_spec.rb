require 'rails_helper'

RSpec.describe 'user show page tests', type: :system do
  test_user = User.create!(name: 'Unique username', bio: 'With a bio')
  Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user)
  Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user)
  Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user)
  Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user)
  Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user)

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Users')
    end

    it 'check that index page loads the user name' do
      visit users_path
      expect(page).to have_content(test_user.name)
    end
    
    it 'check that index page loads the user post count' do
      visit users_path
      expect(page).to have_content('Number of posts:')
      expect(page).to have_content(test_user.posts_count)
    end
  
    it 'check that index page shows the profile picture' do
      visit users_path
      expect(page).to have_css('div.profile-picture')
    end
  
    it 'checks if clicking on a user profile takes you to the user profile page' do
      visit users_path
      click_on(test_user.name)
      expect(page).to have_content(test_user.bio)
    end
  end
end
