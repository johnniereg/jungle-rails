require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'returns true if all validations pass' do
      @category = Category.create!
      @product = Product.create!(name: 'Product', price: 1000, quantity: 5, category: @category)
      expect(@product.valid?).to be(true)
    end
  end
end
