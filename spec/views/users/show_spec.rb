require 'rails_helper'

RSpec.describe "user", type: :system do
 describe "show user" do
    before :each do
        @user = User.create(name: 'young', photo: 'https://picsum.photos/id/23/200', bio: 'lorem ipsum text.', posts_counter: 0)
        @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0, likes_counter: 0)
        @user1 = User.create(name: 'trey', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
        @post1 = Post.create(author_id: @user1.id, title: 'yello', text: 'This is my first post', comment_counter: 0, likes_counter: 0)
        @post2 = Post.create(author_id: @user1.id, title: 'bello', text: 'This is my first post', comment_counter: 0, likes_counter: 0)
        visit user_path(@user.id)   
    end
    it "I can see the user's profile picture" do
     user = @user
      expect(page).to have_css("img[src*='#{user.photo}']")   
    end   
 end
end