require 'rails_helper'

RSpec.describe 'user show page tests', type: :system do
  let(:test_user) do
    user = User.create!(name: 'Special User', bio: 'With a bio', email: 'pogd@g.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:post_one) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user)
  end
  let(:post_two) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user)
  end
  let(:post_three) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user)
  end
  let(:post_four) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user)
  end
  let(:post_five) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user)
  end

  after(:context) do
    test_user.destroy
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

    it 'check that user page shows the first 3 posts' do
      visit user_path(test_user)
      expect(page).to have_content(post_one.title)
      expect(page).to have_content(post_two.title)
      expect(page).to have_content(post_three.title)
      expect(page).not_to have_content(post_four.title)
      expect(page).not_to have_content(post_five.title)
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
