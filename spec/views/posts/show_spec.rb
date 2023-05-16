require 'rails_helper'

RSpec.describe 'post', type: :system do
  describe 'show post' do
    before :each do
      @user = User.first
      @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                          likes_counter: 0)
      @comments = Comment.create(author_id: @user.id, post_id: @post.id, text: 'my first comment')
      @comments = Comment.create(author_id: @user.id, post_id: @post.id, text: 'my second comment')
      @likes = Like.create(author_id: @user.id, post_id: @post.id)
      visit user_post_path(@user.id, @post.id)
    end

    it "I can see the post's title." do
      expect(page).to have_text("post ##{@post.id}")
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_text(@post.user.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_text(@post.comments.length)
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_text(@post.likes.length)
    end

    it 'I can see the post body' do
      expect(page).to have_text(@post.text)
    end
  end
end
