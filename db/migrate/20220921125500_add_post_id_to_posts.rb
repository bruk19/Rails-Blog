class AddPostIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :PostId, :integer
    add_index :posts, :PostId
  end
end
