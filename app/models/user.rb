class User < ApplicationRecord
  has_many :tweets
  
  
  validates :username, presence: true,
                      length: { minimum: 3, maximum: 50 },
                      uniqueness: {case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
