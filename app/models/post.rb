class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_last_five_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at])
  end
end
