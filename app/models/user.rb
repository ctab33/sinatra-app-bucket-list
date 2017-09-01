class User < ActiveRecord::Base
  has_many :lists
  has_many :goals, through: :lists

  has_secure_password
  validates_presence_of :username, :email, :password

end
