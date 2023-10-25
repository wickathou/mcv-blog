class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  def update_comment_count
    post.update(commentsCounter: post.comments.count)
  end
end
