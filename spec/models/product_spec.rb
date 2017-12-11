require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'passes if all fields are filled' do
      @category = Category.create!
      @product = Product.new(name: 'Product', price: 1000, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it 'fails if name is not filled' do
      @category = Category.create!
      @product = Product.new(name: nil, price: 1000, quantity: 5, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails if price is not filled' do
      @category = Category.create!
      @product = Product.new(name: 'Product', price: nil, quantity: 5, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'fails if quantity is not filled' do
      @category = Category.create!
      @product = Product.new(name: 'Product', price: 1000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'fails if category is not filled' do
      @category = Category.create!
      @product = Product.new(name: 'Product', price: 1000, quantity: 10, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end


  end
end
