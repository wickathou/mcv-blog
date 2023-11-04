require 'rails_helper'

describe 'requests for users index' do
  test_user = User.create!(name: 'Tes', bio: 'Different')
  test_post = Post.create!(title: 'Tes', text: 'Different', author: test_user)

  it 'check if response is ok for posts/index' do
    get user_posts_url(test_user)
    expect(response).to be_successful
  end

  it 'check if correct template is rendered for posts/index' do
    get user_posts_url(test_user)
    expect(response).to render_template('posts/index')
  end

  it 'check that body contains the expected text' do
    get user_posts_url(test_user)
    expect(response.body).to include("Back to user profile")
  end

  it 'check if post count is correct' do
    get user_posts_url(test_user), as: :json
    json_response = JSON.parse(response.body)
    expect(json_response['posts'].count).to eq(test_user.posts.all.count)
  end

  it 'checks if a post is returned' do
    get user_post_url(test_user, test_post)
    expect(response).to be_successful
  end

  it 'check if the post template renders' do
    get user_post_url(test_user, test_post)
    expect(response).to render_template('posts/show')
  end

  it 'check that body contains the expected text' do
    get user_post_url(test_user, test_post)
    expect(response.body).to include("Back to all posts")
  end

  it 'check if post data is rendered' do
    get user_post_url(test_user, test_post), as: :json
    json_response = JSON.parse(response.body)
    expect(json_response['post']).to eq(test_post.as_json)
  end
end
