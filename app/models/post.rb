class Post < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end
end
