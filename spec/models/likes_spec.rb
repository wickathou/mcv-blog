require 'rails_helper'

RSpec.describe Like, type: :model do
  new_user = User.create(name: 'John Doe', bio: 'This is a bio')
  new_post = new_user.posts.create(title: 'Title1', text: 'Body1')
  new_like = new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
  bad_like = Like.new

  it 'is valid with valid attributes' do
    expect(new_like).to be_valid
  end

  it 'is not valid without a user_id' do
    expect(bad_like).to_not be_valid
  end

  it 'updates the post likes_count' do
    expect(new_post.likes_count).to eq(1)
  end
end