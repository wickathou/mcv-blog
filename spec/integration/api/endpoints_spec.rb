require 'swagger_helper'

RSpec.describe '/users', type: :request do
  path '/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'users found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   photo: { type: :string },
                   bio: { type: :string },
                   posts_count: { type: :integer },
                   email: { type: :string }
                 }
               }
        run_test!
      end
    end
  end

  path '/posts/{post_id}/comments/' do
    get 'Retrieves all comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :post_id, in: :path, type: :integer

      response '200', 'comments found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   user_id: { type: :integer },
                   post_id: { type: :integer },
                   text: { type: :string }
                 }
               }
        run_test!
      end
    end
  end

  # path '/users/{author_id}/posts/{post_id}/comments/' do
  #   post 'Creates a comment for a post' do
  #     tags 'Comments'
  #     consumes 'application/json'
  #     parameter name: :author_id, in: :path, type: :integer
  #     parameter name: :post_id, in: :path, type: :integer
  #     parameter name: :comment, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         text: { type: :string },
  #         user_id: { type: :integer }
  #       },
  #       required: ['text', 'user_id']
  #     }

  #     response '201', 'comment created' do
  #       let(:comment) { { text: 'This is a comment', user_id: 9 } }
  #       run_test!
  #     end

  #     response '422', 'invalid request' do
  #       let(:comment) { { text: '' } }
  #       run_test!
  #     end
  #   end
  # end

  path '/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :string
    parameter name: 'post_id', in: :path, type: :string

    post 'Creates a comment' do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          comment: {
            type: :object,
            properties: {
              text: { type: :string },
              user_id: { type: :integer }
            },
            required: %w[text user_id]
          }
        }
      }
      # let(:accept) { 'application/json' }
      response '201', 'comment created' do
        let(:user_id) { '9' }
        let(:post_id) { '9' }
        let(:comment) { { comment: { text: 'something', user_id: 9 } } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { comment: { text: '' } } }
        run_test!
      end
    end
  end
end
