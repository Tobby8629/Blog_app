require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'young', photo: 'https://picsum.photos/id/23/200', bio: 'lorem ipsum text.', posts_counter: 0)
    @user1 = User.create(name: 'trey', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  describe 'GET /index' do
    before(:example) { get users_path }

    it 'checks if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if action rendered a correct template' do
      expect(response).to render_template('index')
    end

    it 'checks if correct placeholder is shown' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(@user.id) }

    it 'checks if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'checks if action rendered a correct template' do
      expect(response).to render_template('show')
    end

    it 'checks if correct placeholder is shown' do
      expect(response.body).to include('Here is a user and it recent posts')
    end
  end
end
