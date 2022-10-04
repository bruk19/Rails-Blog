require 'rails_helper'

RSpec.describe 'User pages test index/show ', type: :feature do
  before(:all) do
    @first_user = User.create(Name: 'Bruk', Photo: 
        'https://drive.google.com/file/d/1yi3fHkqGhPsmXconfRANucRZ7EpLl7dw/view',
                              Bio: 'Software developerr')
    @post1 = Post.create(Title: 'Rspec test 1', Text: 'rspec test for post', user: @first_user)
    @post2 = Post.create(Title: 'Rspec test 2', Text: 'rspec test for post', user: @first_user)
    @post3 = Post.create(Title: 'Rspec test 3', Text: 'rspec test for post', user: @first_user)
    @post4 = Post.create(Title: 'Rspec test 4', Text: 'rspec test for post', user: @first_user)
  end

  describe 'User index page test' do
    it 'Should show the username ' do
      visit users_path
      expect(page).to have_content(@first_user.Name)
    end

    it 'Should show the username of all users' do
      visit users_path
      expect(page).to have_content(@first_user.Name)
    end

    it 'Should show the number of posts for each user' do
      visit users_path
      expect(page).to have_content(@first_user.posts.count)
    end

    it 'Should show the Number of posts' do
      visit users_path
      expect(page).to have_text('Number of posts: 4')
    end

    describe 'User show page test' do
        it 'Should show the username ' do
          visit user_path(@first_user)
          expect(page).to have_content(@first_user.Name)
        end
    
        it 'Should show the Number of posts' do
          visit user_path(@first_user)
          expect(page).to have_text('Number of posts: 4')
        end
    
        it 'Should show the bio' do
          visit user_path(@first_user)
          expect(page).to have_content(@first_user.Bio)
        end
    
        it 'Should show user recent 3 posts' do
          visit user_path(@first_user)
          expect(page).to have_content('Rspec test 2')
          expect(page).to have_content('Rspec test 3')
          expect(page).to have_content('Rspec test 4')
        end
    
        it 'Should show button to see all posts ' do
          visit user_path(@first_user)
          expect(page).to have_selector(:link_or_button, 'See all posts', count: 1)
        end
    
        it 'Should show button to see all posts ' do
          visit user_path(@first_user)
          expect(page).to have_selector(:link_or_button, 'See all posts', count: 1)
        end
    
        it 'Should show redirects me to that user\'s posts page. ' do
          visit user_path(@first_user)
          click_on 'See all posts'
          expect(page).to have_current_path(user_posts_path(@first_user))
        end
      end
  end
end