require 'rails_helper'

describe 'requests for users index' do
  it 'check if response is ok' do
    User.create!(name: 'Tes', bio: 'Different')
    get users_url
    expect(response).to be_successful
  end

  it 'check if correct template is rendered' do
    get users_url
    expect(response).to render_template('users/index')
  end

  it 'check if user count is returned' do
    get users_url, as: :json
    json_response = JSON.parse(response.body)
    expect(json_response.count).to eq(User.all.count)
  end

  it 'checks if a user is returned' do
    new_user = User.create!(name: 'New Here', bio: 'With a bio')
    get user_url(new_user)
    expect(response).to be_successful
  end

  it 'check if the user template renders' do
    other_user = User.create!(name: 'New Here', bio: 'With a bio')
    get user_url(other_user)
    expect(response).to render_template('users/show')
  end

  it 'check if user data is rendered' do
    extra_user = User.create!(name: 'New Here', bio: 'With a bio')
    get user_url(extra_user), as: :json
    json_response = JSON.parse(response.body)
    expect(json_response['user']).to eq(extra_user.as_json)
    expect(json_response['posts']).to eq(extra_user.posts.as_json)
  end
end