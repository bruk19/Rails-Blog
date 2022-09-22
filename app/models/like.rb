class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'AuthorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'PostId'

  after_save :update_counter

  def update_counter
    post.increment!(:LikesCounter)
  end
end
