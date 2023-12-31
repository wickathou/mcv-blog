class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bio, length: { maximum: 250 }
  validates :email, presence: true, uniqueness: true

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def first_three_posts
    posts.order(created_at: :asc).limit(3)
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at])
  end
end
