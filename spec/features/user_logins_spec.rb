require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create!(
      first_name: 'Joe',
      last_name: 'Blow',
      email: 'testemail@example.com',
      password: 'testtest',
      password_confirmation: 'testtest'
    )
  end

  scenario "They can login" do
    # ACT
    visit '/login'
    puts page.html

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password

    click_on 'Submit'


    sleep 10

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_text 'Logout'

  end 

end
