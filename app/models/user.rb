class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bio, length: { maximum: 250 }

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
