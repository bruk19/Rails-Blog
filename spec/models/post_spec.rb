require 'rails_helper'

RSpec.describe 'Post', type: :model do
    user1 = User.create(Name: 'Bura', Photo: 'link/bura', Bio: 'Software Developer.')
    post = Post.create(Title: 'Post1', Text: 'Post 1', CommentsCounter: 1, LikesCounter: 0)
  
    before { post.save }
    it 'Title should be present' do
      expect(post.Title).present?
      post.Title = nil
      expect(post).to_not be_valid
    end
  
    it 'CommentsCount should be integer greater or equal to zero' do
      expect(post.CommentsCounter).to be >= 0
      post.CommentsCounter = -1
      expect(post).to_not be_valid
    end
  
    it 'LikesCount should be integer greater or equal to zero' do
      expect(post.LikesCounter).to be >= 0
      post.LikesCounter = -1
      expect(post).to_not be_valid
    end
  
    it 'most be integer and zero or more' do
        post.CommentsCounter = 0
        post.LikesCounter = 'two'
        expect(post).to_not be_valid
    end
end