class User < ActiveRecord::Base

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true 
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
end
