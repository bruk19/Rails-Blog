class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Title
      t.text :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
