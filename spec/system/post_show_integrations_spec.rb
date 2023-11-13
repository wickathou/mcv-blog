require 'rails_helper'

RSpec.describe 'post pages tests', type: :system do
  let(:test_user_one) do
    user = User.create!(name: 'Test User 1', bio: 'With a bio 1', email: 'wqrty@g.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end

  let(:test_user_two) do
    user = User.create!(name: 'Test User 2', bio: 'With a bio 2', email: 'asf@gac.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end

  let(:post_user_one) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_one)
  end

  let(:post_user_one) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_one)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_one)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_one)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_one)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 1', text: 'With some text 1', author: test_user_two)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 2', text: 'With some text 2', author: test_user_two)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 3', text: 'With some text 3', author: test_user_two)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 4', text: 'With some text 4', author: test_user_two)
  end
  let(:post_user_one) do
    Post.create!(title: 'Test Post 5', text: 'With some text 5', author: test_user_two)
  end

  let(:comment_user_one) do
    Comment.create!(text: 'Test Comment 1', user: test_user_two, post: post_user_one)
  end
  let(:comment_user_two) do
    Comment.create!(text: 'Test Comment 2', user: test_user_one, post: post_user_one)
  end
  let(:like_one) do
    Like.create!(user: test_user_two, post: post_user_one)
  end

  after(:context) do
    test_user_one.destroy
    test_user_two.destroy
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
        expect(page).to have_content(test_user_one.name)
        expect(page).to have_content(test_user_two.name)
      end
    end

    it 'shows the text of the comments on the post' do
      visit user_post_path(test_user_one, post_user_one)
      within('ul.comments') do
        expect(page).to have_content(comment_user_one.text)
        expect(page).to have_content(comment_user_two.text)
      end
    end
  end
end
