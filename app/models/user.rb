class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    if @user.authenticate(password)
      @user
    else
      nil
    end
  end

  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true 
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
end
