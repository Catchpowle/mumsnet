class User < ApplicationRecord
  has_many :products, dependent: :destroy

  validates_presence_of :username
  validates_uniqueness_of :username

  has_secure_password
end
