require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(Name: 'Bruk', Photo: 'https://drive.google.com/file/d/1yi3fHkqGhPsmXconfRANucRZ7EpLl7dw/view',
                     Bio: 'Software developer')

  describe 'Tests for User model and validation' do
    it 'is valid ' do
      user.PostCounter = 1
      expect(user).to be_valid
    end

    it 'is not valid' do
      user.PostCounter = -1
      expect(user).to_not be_valid
    end

    it 'Invalid when name not exist' do
      user.Name = nil
      expect(user).to_not be_valid
    end
  end
end
