require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end
    it 'Check if response status was correct' do
      expect(response).to have_http_status(:success)
    end
    it 'Check if a correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(Name: 'Bruk', Photo: 
        'https://drive.google.com/file/d/1yi3fHkqGhPsmXconfRANucRZ7EpLl7dw/view',
                          Bio: 'test for User')
      get user_path(@user)
    end
    
    it 'Check if response status was correct' do
      expect(response).to have_http_status(:success)
    end 
    
  end
end
