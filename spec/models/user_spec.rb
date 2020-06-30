require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    before(:each) do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password"})
    end

    it 'is valid with all valid inputs' do
      expect(@user).to be_valid
    end

    it 'is invalid with no name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is invalid with no email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is invalid when passwords given are not equal' do
      expect(@user).to_not be_valid
    end
  end
end
