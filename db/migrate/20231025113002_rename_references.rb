class RenameReferences < ActiveRecord::Migration[7.0]
  def changePosts
    rename_column :posts, :user_id, :author_id
    add_index :posts, :author_id
  end
  def changeLikes
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
  def changeComments
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
