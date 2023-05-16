require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.first }
  let(:post) { Post.create(author_id: user.id, title: 'hello world', comment_counter: 0, likes_counter: 0) }
  let(:comment) { Comment.new(author_id: user.id, post_id: post.id, text: 'very good craft') }

  describe 'validation' do
    it 'return model is valid' do
      expect(comment).to be_valid
    end
    it 'return model is not valid' do
      comment.update(author_id: nil)
      expect(comment).not_to be_valid
    end
  end

  describe 'update comments_counter' do
    it 'description' do
      comment.save
      post.reload
      expect(post.comment_counter).to eq(1)
    end
  end
end
