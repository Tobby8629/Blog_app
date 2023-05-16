require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'tobby', posts_counter: 0) }

  describe 'validations' do
    it 'is valid with a name' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is valid with a non-negative posts_counter' do
      expect(user).to be_valid
    end

    it 'is invalid with a negative posts_counter' do
      user.posts_counter = -1
      expect(user).not_to be_valid
    end
  end

  describe '#recent_post' do
    let!(:post1) { Post.create(author_id: user.id, comment_counter: 0, likes_counter: 0, title: 'hello world') }
    let!(:post2) { Post.create(author_id: user.id, comment_counter: 0, likes_counter: 0, title: 'hello world') }
    let!(:post3) { Post.create(author_id: user.id, comment_counter: 0, likes_counter: 0, title: 'hello world') }
    let!(:post4) { Post.create(author_id: user.id, comment_counter: 0, likes_counter: 0, title: 'hello world') }

    it 'returns the last 3 posts' do
      expect(user.recent_post).to eq(user.posts.last(3))
    end

    it 'does not return more than 3 posts' do
      expect(user.recent_post.size).to be <= 3
    end

    it 'does not return posts older than 3 days' do
      expect(user.recent_post).not_to include(post1)
    end
  end
end
