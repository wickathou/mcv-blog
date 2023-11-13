require 'rails_helper'

RSpec.describe 'user show page tests', type: :system do
  let(:test_user) do
    user = User.create!(name: 'Unique username', bio: 'With a bio', email: 'ytht@g.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user)
  end
  let(:post_user_two) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user)
  end
  let(:post_user_three) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user)
  end
  let(:post_user_four) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user)
  end
  let(:post_user_five) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user)
  end

  after(:context) do
    test_user.destroy
  end

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
      unique_user = User.create!(name: 'Unique person', bio: 'Extra with a bio')
      visit users_path
      click_on(unique_user.name)
      expect(page).to have_content(unique_user.bio)
    end
  end
end
