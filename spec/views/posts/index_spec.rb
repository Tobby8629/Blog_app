require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'post index' do
    before :each do
      @user = User.first
      @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                          likes_counter: 0)
      @post1 = Post.create(author_id: @user.id, title: 'yello', text: 'This is my first post', comment_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(author_id: @user.id, title: 'bello', text: 'This is my first post', comment_counter: 0,
                           likes_counter: 0)
      @comments = Comment.create(author_id: @user.id, post_id: @post.id, text: 'my first comment')
      @comments = Comment.create(author_id: @user.id, post_id: @post.id, text: 'my second comment')
      @likes = Like.create(author_id: @user.id, post_id: @post.id)
      visit user_posts_path(@user.id)
      @posts = Post.where(author_id: @user.id)
    end
    it "I can see the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_text(@user.name.to_s)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_text("Number of posts: #{@user.posts.length}")
    end
    it "I can see a post's title" do
      @posts.each do |e|
        expect(page).to have_text("post ##{e.id}")
      end
    end
    it "I can see some of the post's body" do
      @posts.each do |e|
        expect(page).to have_text(e.text.first(100))
      end
    end
    it 'I can see the first comments on a post.' do
      @posts.each do |e|
        expect(page).to have_text(e.comments[1].text) unless e.comments.empty?
      end
    end
    it 'I can see how many comments a post has.' do
      @posts.each do |e|
        expect(page).to have_text(e.comments.length)
      end
    end
    it 'I can see how many likes a post has.' do
      @posts.each do |e|
        expect(page).to have_text(e.likes.length)
      end
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_text('pagination')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      @posts.each do |e|
        click_link e.id
        expect(page).to have_text('Here is one of the posts written by a user')
        click_on 'Back'
      end
    end
  end
end
