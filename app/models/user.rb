class User < ApplicationRecord
    has_many :posts, class_name: "Post", foreign_key: "AuthorId"
    has_many :comments, class_name: "Comment", foreign_key: "AuthorId"
    has_many :likes, class_name: "Like", foreign_key: "AuthorId"

    def recent_post
        posts.order(create_at: :desc).limit(3)
    end
end