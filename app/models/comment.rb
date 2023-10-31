class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id', counter_cache: true
  validates :text, presence: true, length: { minimum: 3, maximum: 250 }
end
