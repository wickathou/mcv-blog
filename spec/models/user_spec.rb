require 'rails_helper'

RSpec.describe User, type: :model do
  new_user_valid = User.create(name: 'John Doe', bio: 'This is a bio', email: 'jack@j.com')

  before do
    new_user_valid.posts.destroy_all
    new_user_valid.reload
  end

  it 'check if post counter is zero after creating and deleting a post' do
    new_post = new_user_valid.posts.create(title: 'Title1', text: 'Body1')
    new_post.destroy
    new_user_valid.reload
    expect(new_user_valid.posts_count).to eq(0)
  end

  it 'is valid with valid attributes' do
    expect(new_user_valid).to be_valid
  end

  it 'check if post counter is by default 0' do
    expect(new_user_valid.posts_count).to eq(0)
  end

  it 'has bio' do
    expect(new_user_valid.bio).to eq('This is a bio')
  end

  it 'post counter is 4' do
    new_user_valid.posts.create(title: 'Title1', text: 'Body1', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title2', text: 'Body2', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title3', text: 'Body3', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title4', text: 'Body4', author_id: new_user_valid.id)
    expect(new_user_valid.posts_count).to eq(4)
  end

  it 'returns the last three posts' do
    new_user_valid.posts.create(title: 'Title1', text: 'Body1', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title2', text: 'Body2', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title3', text: 'Body3', author_id: new_user_valid.id)
    expect(new_user_valid.last_three_posts.count).to eq(3)
  end

  it 'returns the last three posts' do
    new_user_valid.posts.create(title: 'Title1', text: 'Body1', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title2', text: 'Body2', author_id: new_user_valid.id)
    new_user_valid.posts.create(title: 'Title3', text: 'Body3', author_id: new_user_valid.id)
    expect(new_user_valid.last_three_posts).to eq(new_user_valid.posts.order(created_at: :desc).limit(3))
  end

  it 'is not valid without a name' do
    new_user_invalid = User.new
    expect(new_user_invalid).to_not be_valid
  end

  it 'is not valid if post count is less than zero' do
    other_user_invalid = User.new(name: 'tas', bio: 'A bio', posts_count: -1)
    expect(other_user_invalid).to_not be_valid
  end
end
