require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get users_path }
    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end
  end
end