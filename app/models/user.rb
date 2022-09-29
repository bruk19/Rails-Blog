class User < ApplicationRecord
  validates :Name, presence: true
  validates :PostCounter, Numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, class_name: 'Post', foreign_key: 'AuthorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'AuthorId'
  has_many :likes, class_name: 'Like', foreign_key: 'AuthorId'

  def recent_post
    posts.order(create_at: :desc).limit(3)
  end

  def all_posts
    posts.order(created_at: :desc)
  end
end
