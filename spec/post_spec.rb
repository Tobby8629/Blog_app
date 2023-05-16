require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.first }
  let(:post) { Post.new(author_id: user.id, title: 'hello world', comment_counter: 0, likes_counter: 0) }

  describe 'validation' do
    it 'validate the post model' do
      expect(post).to be_valid
    end
    it 'it invalid when the counter is negative' do
      post.update(comment_counter: -1)
      expect(post).not_to be_valid
    end
    it 'it invalid when the counter is negative' do
      post.update(likes_counter: -1)
      expect(post).not_to be_valid
    end
  end

  describe 'recent_comments' do
    let!(:comment1) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment2) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment3) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment4) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment5) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment6) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }
    let!(:comment7) { Comment.create(author_id: user.id, post_id: post.id, text: 'checkout my piece') }

    it 'return last 5 comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
    end

    it 'return size of recent comment' do
      expect(post.recent_comments.size).to be <= 5
    end

    it 'return size of recent comment' do
      expect(post.recent_comments).not_to include(comment1, comment2)
    end
  end

  describe '#update_posts_counter' do
    it 'updates the posts_counter of the author after creating a new post' do
      expect(user.posts_counter).to eq(0)
      post.save
      user.reload
      expect(user.posts_counter).to eq(1)
    end
  end
end
