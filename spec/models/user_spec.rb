require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'is valid with all valid inputs' do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password"})
      expect(@user).to be_valid
    end

    it 'is invalid with no name' do
      @user = User.new({email: "lucas@mail.com", password: "password", password_confirmation: "password"})
      expect(@user).to_not be_valid
    end

    it 'is invalid with no email' do
      @user = User.new({name: "Lucas Wong", password: "password", password_confirmation: "password"})
      expect(@user).to_not be_valid
    end

    it 'is invalid with no password' do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password_confirmation: "password"})
      expect(@user).to_not be_valid
    end

    it 'is invalid with no password_confirmation' do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password: "password"})
      expect(@user).to_not be_valid
    end

    it 'is invalid when passwords given are not equal' do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password: "passwo", password_confirmation: "password"})
      expect(@user).to_not be_valid
    end

    it 'is invalid when passwords are not long enough' do
      @user = User.new({name: "Lucas Wong", email: "lucas@mail.com", password: "pass", password_confirmation: "pass"})
      expect(@user).to_not be_valid
    end

    it 'is invalid when email is not unique' do
      User.create!(name: "Lucas Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password")
      @user = User.new({name: "Alex Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password"})
      expect(@user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      User.create!(name: "Lucas Wong", email: "lucas@mail.com", password: "password", password_confirmation: "password")
    end

    it 'authenticate successfully when correct input' do
      @user = User.authenticate_with_credentials("lucas@mail.com", "password")
      expect(@user).to be_truthy
    end

    it 'authenticate successfully when extra spaces in email' do
      @user = User.authenticate_with_credentials("  lucas@mail.com", "password")
      expect(@user).to be_truthy
    end

    it 'authenticate successfully when email has wrong casing' do
      @user = User.authenticate_with_credentials("LucaS@mAIl.com", "password")
      expect(@user).to be_truthy
    end
  end
end
