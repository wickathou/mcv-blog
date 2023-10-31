class RenameCols < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :postCounter, :posts_count
    rename_column :posts, :commentsCounter, :comments_count
    rename_column :posts, :likesCounter, :likes_count
  end
end
