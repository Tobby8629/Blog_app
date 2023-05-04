class Comment < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "author_id"
    belongs_to :post, class_name: "Post", foreign_key: "post_id"

    def comment_counter(post)
        array = post.comments
        post.comment_counter = array.length
    end
end
