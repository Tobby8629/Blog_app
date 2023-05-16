require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'show user' do
    before :each do
      @user = User.create(name: 'young', photo: 'https://picsum.photos/id/23/200', bio: 'lorem ipsum text.',
                          posts_counter: 0)
      @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0,
                          likes_counter: 0)
      @user1 = User.create(name: 'trey', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @post1 = Post.create(author_id: @user1.id, title: 'yello', text: 'This is my first post', comment_counter: 0,
                           likes_counter: 0)
      @post2 = Post.create(author_id: @user1.id, title: 'bello', text: 'This is my first post', comment_counter: 0,
                           likes_counter: 0)
      visit user_path(@user.id)
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
    it "I can see the user's bio." do
      expect(page).to have_text(@user.bio)
    end
    it "I can see the user's first 3 posts." do
      @user.recent_post.each do |e|
        expect(page).to have_text("post ##{e.id}")
      end
    end
    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_button('see all post')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      @user.recent_post.each do |e|
        click_on e.text
        expect(page).to have_text('Here is one of the posts written by a user')
      end
    end
    it "When I click to see all posts, it redirects me to the user's post's index page" do
      click_link 'see all post'
      expect(page).to have_text('Here is the list of posts for a particular user')
    end
  end
end
