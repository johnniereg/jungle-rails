require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    context 'on a new user' do

      it 'should not be valid without a password' do
        @user = User.new password: nil, password_confirmation: nil, first_name: 'Jo', last_name: 'Blo', email: 'test@test.com'
        expect(@user).to_not be_valid
      end

    end



  end
end
