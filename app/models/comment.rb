class  Comment < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "AuthorId"
    belongs_to :post, class_name: "Post", foreign_key: "PostId"

    after_save :update_counter

    def update_counter
        post.CommentsCounter.nil? ? post.CommentsCounter = 1 : post.CommentsCounter += 1
        post.update(CommentsCounter: post.CommentsCounter)
    end
end