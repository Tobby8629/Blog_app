class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def likes_counter(post)
    array = post.likes
    post.likes_counter = array.length
  end
end
