class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  def recent_post
    array = posts
    array[-3..]
  end
end
