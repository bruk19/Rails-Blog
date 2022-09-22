class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  belongs_to :post, :post_id

  after_save :update_counter

  def update_counter
    post.increment!(:CommentsCounter)
  end
end
