require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'Return http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  it 'Should render the index template' do
    get '/users/index'
    expect(response).to render_template(:index)
  end

  it 'does not render a different template' do
    get '/users/index'
    expect(response).to_not render_template(:show)
  end

  it 'Should include the correct placeholder' do
    get '/users/index'
    expect(response.body).to include(' Here is a list of Users.')
  end

  describe 'GET /show' do
    it 'Return http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  it 'Should render the index template' do
    get '/users/show'
    expect(response).to render_template(:show)
  end

  it 'does not render a different template' do
    get '/users/show'
    expect(response).to_not render_template(:index)
  end

  it 'Should include the correct placeholder' do
    get '/users/show'
    expect(response.body).to include(' Here is a list of Single User. ')
  end
end
