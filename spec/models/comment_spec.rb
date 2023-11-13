require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:new_user) do
    user = User.new(name: 'Tes', bio: 'Different', email: 'qweiuorq@j.com', password: '123456')
    user.skip_confirmation!
    user.save!
    user
  end
  let(:new_post) do
    new_user.posts.create(title: 'Title1', text: 'Body1')
  end

  let(:new_comment) do
    new_post.comments.create(user_id: new_user.id, text: 'This is a comment')
  end

  let(:bad_comment) do
    Comment.new
  end
  # new_user = User.create(name: 'John Doe', bio: 'This is a bio', email: 'jack@j.com', password: '123456').confirm
  # new_post = new_user.posts.create(title: 'Title1', text: 'Body1')
  # new_comment = new_post.comments.create(user_id: new_user.id, text: 'This is a comment')
  # bad_comment = Comment.new

  it 'is valid with valid attributes' do
    expect(new_comment).to be_valid
  end

  it 'is not valid without a user_id' do
    expect(bad_comment).to_not be_valid
  end

  it 'updates the post comments_count' do
    expect(new_post.comments_count).to eq(1)
  end
end
