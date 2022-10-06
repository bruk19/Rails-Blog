class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :Name, presence: true
  validates :PostCounter, Numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, class_name: 'Post', foreign_key: 'authorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'authorId'
  has_many :likes, class_name: 'Like', foreign_key: 'authorId'

  def recent_post
    posts
  end

  def all_posts
    posts.order(created_at: :desc)
  end
end
