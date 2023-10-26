require 'rails_helper'

RSpec.describe Post, type: :model do
  new_user = User.create(name: 'John Doe', bio: 'This is a bio')
  new_post = new_user.posts.create(title: 'Title1', text: 'Body1')

  before do
    new_post.comments.destroy_all
    new_post.likes.destroy_all
  end

  it 'adds a post to the user' do
    expect(new_user.posts_count).to eq(1)
  end

  it 'shows count of comments on post' do
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 0')
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 1')
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 2')
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 3')
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 4')
    new_post.comments.create(user_id: new_user.id, post_id: new_post.id, text: 'This is a comment 5')
    expect(new_post.comments_count).to eq(6)
  end

  it 'creates like on post' do
    new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
    new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
    new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
    expect(new_post.likes_count).to eq(3)
  end

  it 'returns the last five comments' do
    expect(new_post.return_last_five_comments).to eq(new_post.comments.order(created_at: :desc).limit(5))
  end

  it 'post is invalid without a title' do
    expect(Post.new(text: 'Body1', author_id: new_user.id)).to_not be_valid
  end
end
