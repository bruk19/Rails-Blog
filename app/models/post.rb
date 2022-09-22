class  Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "AuthorId"
    has_many :comments, class_name: "Comment", foreign_key: "PostId"
    has_many :likes, class_name: "Like", foreign_key: "PostId"

    after_save :update_counter

    def update_counter
        user.PostCounter.nil? ? user.PostCounter = 1 : user.PostCounter += 1
        user.update(PostCounter: user.PostCounter)
    end

    def recent_comment
        comments.order(created_at: :desc).limit(5)
    end
end