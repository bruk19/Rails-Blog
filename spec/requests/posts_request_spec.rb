require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(Name: 'Bruk', 
        Photo: 'https://drive.google.com/file/d/1yi3fHkqGhPsmXconfRANucRZ7EpLl7dw/view', 
        Bio: 'Software developer')
      get user_posts_path(@user)
  end

  it 'Check if response status was correct' do
    expect(response).to have_http_status(:success)
  end

  it 'Check if a correct template was rendered' do
    expect(response).to render_template(:index)
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(Name: 'Jo', Photo: 'sodome/png', Bio: 'web Developer from Ethiopia')
      @post = Post.create(user: @user, Title: 'test', Text: 'A test post')
      get user_posts_path(@user, @post)

      it 'Check if response status was correct' do
        expect(response).to have_http_status(:success)
      end

      it 'Check if a correct template was rendered' do
        expect(response).to_not render_template(:show)
      end
    end
  end
  

  end
end