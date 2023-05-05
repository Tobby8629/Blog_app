class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_comment_counter

  def update_comment_counter
    post.update(comment_counter: post.comments.length)
  end
end
