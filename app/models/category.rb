class Category < ApplicationRecord
  scope :all_by_latest_product, lambda {
    left_outer_joins(:categories_products)
      .order('categories_products.created_at DESC')
  }

  has_many :categories_products, dependent: :destroy
  has_many :products, through: :categories_products

  validates :title, presence: true
end
