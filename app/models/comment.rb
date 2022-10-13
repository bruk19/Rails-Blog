class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_create :update_counter
  after_destroy :comment_decrement

  def update_counter
    post.increment!(:CommentsCounter)
  end

  def comment_decrement
    post.decrement!(:CommentsCounter)
  end
end
