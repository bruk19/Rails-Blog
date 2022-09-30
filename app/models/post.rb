class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  # validates :LikesCounter, numericality: { only_integer: true,
  # greater_than_or_equal_to: 0 }
  # validates :CommentsCounter, numericality: { only_integer: true,
  # greater_than_or_equal_to: 0 }

  belongs_to :user, class_name: 'User', foreign_key: 'authorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'PostId'
  has_many :likes, class_name: 'Like', foreign_key: 'PostId'

  after_create :update_counter

  def update_counter
    user.increment!(:PostCounter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
