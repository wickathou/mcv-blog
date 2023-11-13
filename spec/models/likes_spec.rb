require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:new_user) do
    user = User.new(name: 'Tes', bio: 'Different', email: 'qweiuorq@j.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:new_post) do
    new_user.posts.create(title: 'Title1', text: 'Body1')
  end

  let(:new_like) do
    new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
  end

  let(:bad_like) do
    Like.new
  end
  # new_post = new_user.posts.create(title: 'Title1', text: 'Body1')
  # new_like = new_post.likes.create(user_id: new_user.id, post_id: new_post.id)
  # bad_like = Like.new

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
