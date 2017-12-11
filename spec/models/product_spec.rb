require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'pass if all fields are filled' do
      @category = Category.create!
      @product = Product.new(name: 'Product', price: 1000, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it 'fail if name is not filled' do
      @category = Category.create!
      @product = Product.new(name: nil, price: 1000, quantity: 5, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


  end
end
