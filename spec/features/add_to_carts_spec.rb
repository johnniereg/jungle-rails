require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click Add To Cart and increase cart count" do
    # ACT
    visit root_path

    click_link('Add', match: :first)

    sleep 5

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_text 'My Cart (1)'


  end
  
end
