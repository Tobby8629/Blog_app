class Post < ApplicationRecord
    has_many :comments, class_name: "Comment", foreign_key: "post_id"
    has_many :likes, class_name: "Like", foreign_key: "post_id"
    belongs_to :user, class_name: "User", foreign_key: "author_id"

    def posts_counter(user)
     array = user.posts
     user.posts_counter = array.length
    end

    def recent_comment
     array=self.comments
     array[-5..-1]
    end
end
