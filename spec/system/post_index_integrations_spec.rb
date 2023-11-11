require 'rails_helper'

RSpec.describe 'post pages tests', type: :system do
  let(:test_user_one) do
    user = User.new(name: 'Test User 1', bio: 'With a bio 1', email: 'qweiuorq@j.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:test_user_two) do
    user = User.new(name: 'Test User 2', bio: 'With a bio 2', email: 'qweiuorq@j.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_one)
  end

  let(:post_user_two) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_one)
  end
  let(:post_user_three) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_one)
  end
  let(:post_user_four) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_one)
  end
  let(:post_user_five) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_one)
  end
  let(:post_user_six) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_two)
  end
  let(:post_user_seven) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_two)
  end
  let(:post_user_eight) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_two)
  end
  let(:post_user_nine) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_two)
  end
  let(:post_user_ten) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_two)
  end

  let(:comment_user_one) do
    Comment.create!(text: 'Test Comment 1', user: test_user_two, post: post_user_one)
  end

  let(:like_one) do
    Like.create!(user: test_user_two, post: post_user_one)
  end

  after(:context) do
    test_user_one.destroy
    test_user_two.destroy
  end

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
end
