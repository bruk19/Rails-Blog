class AddDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :PostCounter, :integer, default: 0
    change_column :posts, :LikesCounter, :integer, default: 0
    change_column :posts, :CommentsCounter, :integer, default: 0
  end
end
