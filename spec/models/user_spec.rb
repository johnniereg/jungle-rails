require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should be valid with a password that matches' do
      @user = User.new password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      expect(@user).to be_valid
    end

    it 'should not be valid without a password' do
      @user = User.new password: nil, password_confirmation: nil, first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      expect(@user).to_not be_valid
    end

    it 'should not be valid when passwords do not match' do
      @user = User.new password: 'testtest', password_confirmation: 'testtest2', first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      expect(@user).to_not be_valid
    end

    it 'should not be valid when confirmation is blank' do
      @user = User.new password: 'testtest', password_confirmation: '', first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      expect(@user).to_not be_valid
    end

    it 'should not be valid when email not unique' do
      @user1 = User.create! password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      @user2 = User.new password: 'testtest', password_confirmation: 'testtest', first_name: 'Jane', last_name: 'Blo', email: 'test@test.com'
      expect(@user2).to_not be_valid
    end

    it 'should not be valid when email not unique with different case sensitivity' do
      @user1 = User.create! password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
      @user2 = User.new password: 'testtest', password_confirmation: 'testtest', first_name: 'Jane', last_name: 'Blo', email: 'TEST@test.com'
      expect(@user2).to_not be_valid
    end

    it 'should not be valid when email is not present' do
      @user = User.new password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: nil
      expect(@user).to_not be_valid
      
    end

    it 'should not be valid when first_name is not present' do
      @user = User.new password: 'testtest', password_confirmation: 'testtest', first_name: nil, last_name: 'Blo', email: 'test@test.com'
      expect(@user).to_not be_valid
      
    end

    it 'should not be valid when last_name is not present' do
      @user = User.new password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: nil, email: 'test@test.com'
      expect(@user).to_not be_valid
      
    end


  end

  describe '.authenticate_with_credentials' do

    it 'should return an instance of the user if successfully authenticated' do
      @user1 = User.create! password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'testing@test.com'      
      user = User.authenticate_with_credentials('testing@test.com', 'testtest')
      expect(user).to be_an_instance_of User
    end

    it 'should return nil if not successfully authenticated' do
      user = User.authenticate_with_credentials('test2@test.com', 'testtest')
      expect(user).to be(nil)
    end

    it 'should authenticate even with spaces around the email' do
      @user1 = User.create! password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'testing@test.com'      
      user = User.authenticate_with_credentials('  testing@test.com  ', 'testtest')
      expect(user).to be_an_instance_of User
             
    end

    it 'should authenticate even if user types the wrong case' do
      @user1 = User.create! password: 'testtest', password_confirmation: 'testtest', first_name: 'Jo', last_name: 'Blo', email: 'testing@test.com'      
      user = User.authenticate_with_credentials('TESTING@test.com', 'testtest')
      expect(user).to be_an_instance_of User
          
    end

  end



end
