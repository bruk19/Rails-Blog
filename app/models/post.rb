class  Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "AuthorId"
    has_many :comments, class_name: "Comment", foreign_key: "PostId"
    has_many :likes, class_name: "Like", foreign_key: "PostId"
end