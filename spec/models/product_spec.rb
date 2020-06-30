require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @product = Product.new({name: "Massage Chair", price: 1500, quantity: 1})
      @category = Category.new()
      @product.category = @category
    end
    it "product is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it "product is not valid with a nil name" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "product is not valid with nil quanitity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "product is not valid with nil price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "product is not valid with nil category" do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
