class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def update_user_post_counter
    author.update(postCounter: author.posts.count)
  end

  def return_last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
