class DefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :postCounter, :integer, default: 0
    change_column :posts, :commentsCounter, :integer, default: 0
    change_column :posts, :likesCounter, :integer, default: 0
  end
end
