require 'rails_helper'

RSpec.describe 'user show page tests', type: :system do
  test_user = User.create!(name: 'Test User', bio: 'With a bio')
  post_one = Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user)
  post_two = Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user)
  post_three = Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user)
  post_four = Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user)
  post_five = Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user)

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Users')
    end
  end

  describe 'user show page' do
    it 'check that show page loads the user name' do
      visit user_path(test_user)
      expect(page).to have_content(test_user.name)
    end

    it 'check that show page loads the user post count' do
      visit user_path(test_user)
      expect(page).to have_content('Number of posts:')
      expect(page).to have_content(test_user.posts_count)
    end

    it 'check that user page shows the profile picture' do
      visit user_path(test_user)
      expect(page).to have_css('div.profile-picture')
    end

    it 'check that user page shows the user bio' do
      visit user_path(test_user)
      expect(page).to have_content(test_user.bio)
    end

    it 'check that user page shows the last 3 posts' do
      visit user_path(test_user)
      expect(page).to have_content(post_three.title)
      expect(page).to have_content(post_four.title)
      expect(page).to have_content(post_five.title)
      expect(page).not_to have_content(post_one.title)
      expect(page).not_to have_content(post_two.title)
    end

    it 'check if button exist in the user page with the string See all posts' do
      visit user_path(test_user)
      expect(page).to have_link('See all posts')
    end

    it 'checks that clicking on a post title takes you to the post page' do
      visit user_path(test_user)
      click_on(post_three.title)
      expect(page).to have_content(post_three.title)
      expect(page).to have_content(post_three.text)
    end

    it 'check that user can click on button to view all posts' do
      visit user_path(test_user)
      click_on('See all posts')
      expect(page).to have_content(post_one.title)
      expect(page).to have_content(post_two.title)
      expect(page).to have_content(post_three.title)
      expect(page).to have_content(post_four.title)
      expect(page).to have_content(post_five.title)
    end
  end
end