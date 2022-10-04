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
  end


end