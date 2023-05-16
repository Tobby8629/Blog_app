require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.first }
  let(:post) do
    Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', comment_counter: 0, likes_counter: 0)
  end

  describe 'GET /index' do
    before(:example) { get user_posts_path(user.id) }

    it 'checks if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if action rendered a correct template' do
      expect(response).to render_template('index')
    end

    it 'checks if correct placeholder is shown' do
      expect(response.body).to include('Here is the list of posts for a particular user')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(user.id, post.id) }

    it 'checks if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if action rendered a correct template' do
      expect(response).to render_template('show')
    end

    it 'checks if correct placeholder is shown' do
      expect(response.body).to include('Here is one of the posts written by a user')
    end
  end
end
