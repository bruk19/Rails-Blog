class RenameIds < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    rename_column :comments, :user_id, :authorId
    rename_column :likes, :user_id, :authorId
    rename_column :posts, :user_id, :authorId
  end
end
