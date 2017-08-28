class Product < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user

  has_many :categories_products, dependent: :destroy
  has_many :categories, through: :categories_products

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
end
