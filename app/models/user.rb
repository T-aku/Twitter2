class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :tweets
  has_many :friendships
  has_many :friends, through: :friendships
  
  validates :username, presence: true,
                      length: { minimum: 3, maximum: 50 },
                      uniqueness: {case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
