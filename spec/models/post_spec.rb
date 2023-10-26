require 'rails_helper'

RSpec.describe Post, type: :model do
  newUser = User.create(name: 'John Doe', bio: 'This is a bio')
  newPost = newUser.posts.create(title: 'Title1', text: 'Body1')

  before do
    newPost.comments.destroy_all
    newPost.likes.destroy_all
  end
  
  
  it 'adds a post to the user' do
    expect(newUser.posts_count).to eq(1)
  end
  
  it 'shows count of comments on post' do
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 0')
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 1')
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 2')
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 3')
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 4')
    newPost.comments.create(user_id: newUser.id, post_id: newPost.id, text: 'This is a comment 5')
    expect(newPost.comments_count).to eq(6)
  end

  it 'creates like on post' do
    newPost.likes.create(user_id: newUser.id, post_id: newPost.id)
    newPost.likes.create(user_id: newUser.id, post_id: newPost.id)
    newPost.likes.create(user_id: newUser.id, post_id: newPost.id)
    expect(newPost.likes_count).to eq(3)
  end

  it 'returns the last five comments' do
    expect(newPost.return_last_five_comments).to eq(newPost.comments.order(created_at: :desc).limit(5))
  end

  it 'post is invalid without a title' do
    expect(Post.new(text: 'Body1', author_id: newUser.id)).to_not be_valid
  end

end