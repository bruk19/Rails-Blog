class  Comment < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "AuthorId"
    belongs_to :post, class_name: "Post", foreign_key: "PostId"
end