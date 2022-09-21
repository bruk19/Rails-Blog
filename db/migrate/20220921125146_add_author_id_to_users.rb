class AddAuthorIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :AuthorId, :integer
    add_index :users, :AuthorId
  end
end
