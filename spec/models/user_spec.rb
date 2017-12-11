require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context 'on a new user' do

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



    end



  end
end
