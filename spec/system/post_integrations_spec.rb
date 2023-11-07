require 'rails_helper'

RSpec.describe 'post pages tests', type: :system do
  test_user_one = User.create!(name: 'Test User 1', bio: 'With a bio 1')
  test_user_two = User.create!(name: 'Test User 2', bio: 'With a bio 2')
  post_user_one = Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_one)
  Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_one)
  Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_one)
  Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_one)
  Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_one)
  Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_two)
  Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_two)
  Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_two)
  Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_two)
  Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_two)
  comment_user_one = Comment.create!(text: 'Test Comment 1', user: test_user_two, post: post_user_one)
  Like.create!(user: test_user_two, post: post_user_one)

  describe 'User posts index page' do
    it 'shows the user profile picture' do
      visit user_posts_path(test_user_one)
      expect(page).to have_css('div.profile-picture')
    end

    it 'check that show page loads the user name' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content(test_user_one.name)
    end

    it 'check that show page loads the user post count' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content('Number of posts:')
      expect(page).to have_content(test_user_one.posts_count)
    end

    it 'check that a post title is rendered' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content(post_user_one.title)
    end

    it 'check that a post text is rendered' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content(post_user_one.text)
    end

    it 'check that comments are rendered' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content(comment_user_one.text)
    end

    it 'checks that the comment count is shown' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content('Comments:')
      expect(page).to have_content(post_user_one.comments_count)
    end

    it 'checks that the likes count is shown' do
      visit user_posts_path(test_user_one)
      expect(page).to have_content('Likes:')
      expect(page).to have_content(post_user_one.likes_count)
    end

    it 'checks that the pagination button is shown' do
      visit user_posts_path(test_user_one)
      expect(page).to have_button('Load more posts')
    end

    it 'checks that when clicking on a post title takes you to the post page' do
      visit user_posts_path(test_user_one)
      click_on(post_user_one.title)
      expect(page).to have_content(post_user_one.title)
      expect(page).to have_content(post_user_one.text)
    end
  end

  describe 'User posts show page' do
    it 'shows the title of the post' do
      visit user_post_path(test_user_one, post_user_one)
      expect(page).to have_content(post_user_one.title)
    end

    it 'shows the username of the author' do
      visit user_post_path(test_user_one, post_user_one)
      expect(page).to have_content(test_user_one.name)
    end

    it 'checks that the comment count is shown' do
      visit user_post_path(test_user_one, post_user_one)
      expect(page).to have_content('Comments:')
      expect(page).to have_content(post_user_one.comments_count)
    end

    it 'checks that the likes count is shown' do
      visit user_post_path(test_user_one, post_user_one)
      expect(page).to have_content('Likes:')
      expect(page).to have_content(post_user_one.likes_count)
    end

    it 'shows the body text of the post' do
      visit user_post_path(test_user_one, post_user_one)
      expect(page).to have_content(post_user_one.text)
    end

    it 'shows the names of the people leaving comments on the post' do
      visit user_post_path(test_user_one, post_user_one)
      within('ul.comments') do
        expect(page).to have_content(test_user_two.name)
      end
    end

    it 'shows the text of the comments on the post' do
      visit user_post_path(test_user_one, post_user_one)
      within('ul.comments') do
        expect(page).to have_content(comment_user_one.text)
      end
    end
  end
end
