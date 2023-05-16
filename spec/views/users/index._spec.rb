require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'young', photo: 'https://picsum.photos/id/23/200', bio: 'lorem ipsum text.',
                          posts_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                          likes_counter: 0)
      @user1 = User.create(name: 'trey', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @post1 = Post.create(author_id: @user1.id, title: 'yello', text: 'This is my first post',
                           comment_counter: 0, likes_counter: 0)
      @post2 = Post.create(author_id: @user1.id, title: 'bello', text: 'This is my first post',
                           comment_counter: 0, likes_counter: 0)
      visit users_path
      @users = User.all
    end
    it 'to see all username in the homepage' do
      @users.each do |user|
        expect(page).to have_text(user.name)
      end
    end
    it 'shows each user image' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
    it 'I can see the number of posts each user has written.' do
      @users.each do |user|
        expect(page).to have_text("Number of posts: #{user.posts.length}")
      end
    end
    it 'When I click on a user, I am redirected to that users show page' do
      @users.each do |user|
        click_on user.name
        expect(page).to have_text('Here is a user and it recent posts')
        click_on 'Back'
      end
    end
  end
end
