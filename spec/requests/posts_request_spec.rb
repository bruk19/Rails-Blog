require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    describe 'GET /index' do
        it 'Return http success' do 
          get '/posts/index'
          expect(response).to have_http_status(:success)
        end
    end

    describe 'GET /show' do
        it 'Return http success' do
          get '/posts/show'
          expect(response).to have_http_status(:success)
        end
    end

    it 'Should render the index template' do 
        get '/posts/show'
        expect(response).to render_template(:show)
    end

    it 'does not render a different template' do 
        get '/posts/show'
        expect(response).to_not render_template(:index)
    end
end
