require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(Name: 'Bruk', Photo: 'link/bura.png', Bio: 'Full-Stack developer')
   
  describe 'Tests for User model and validation' do
    
    it 'Name should be present' do
        expect(subject.Name).present?
        subject.Name = nil
        expect(subject).to_not be_valid
      end

    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'Invalid when name not exist' do
      user.Name = nil
      expect(user).to_not be_valid
    end
  end
end