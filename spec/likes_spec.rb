require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.first }
  let(:post) { Post.create(author_id: user.id, title: 'hello world', comment_counter: 0, likes_counter: 0) }
  let(:like) { Like.new(author_id: user.id, post_id: post.id) }

  describe 'validation' do
    it 'return model is valid' do
      expect(like).to be_valid
    end
    it 'return model is not valid' do
      like.update(author_id: nil)
      expect(like).not_to be_valid
    end
  end

  describe 'update likes_counter' do
    it 'description' do
      like.save
      post.reload
      expect(post.likes_counter).to eq(1)
    end
  end
end
