require 'rails_helper'

RSpec.describe User, type: :model do
  newUserValid = User.create(name: 'John Doe', bio: 'This is a bio')
  newUserInvalid = User.new

  before do
    newUserValid.posts.destroy_all
  end
  

  it 'is valid with valid attributes' do
    expect(newUserValid).to be_valid
  end

  it 'returns the last three posts' do
    expect(newUserValid.last_three_posts).to eq(newUserValid.posts.order(created_at: :desc).limit(3))
  end
  
  it 'has bio' do
    expect(newUserValid.bio).to eq('This is a bio')
  end
  
  it 'post counter is 4' do
    newUserValid.posts.create(title: 'Title1', text: 'Body1', author_id: newUserValid.id)
    newUserValid.posts.create(title: 'Title2', text: 'Body2', author_id: newUserValid.id)
    newUserValid.posts.create(title: 'Title3', text: 'Body3', author_id: newUserValid.id)
    newUserValid.posts.create(title: 'Title4', text: 'Body4', author_id: newUserValid.id)
    expect(newUserValid.posts_count).to eq(4)
  end

  it 'is not valid without a name' do
    expect(newUserInvalid).to_not be_valid
  end

end