class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :email, presence:true, uniqueness:true
  has_many :comments

end
