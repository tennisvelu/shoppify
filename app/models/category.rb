class Category < ApplicationRecord
  validates :name, uniqueness: true, :presence => true
  has_one :product_category
  has_one :product, through: :product_category
  has_many :category_subcategories
  has_many :sub_categories, through: :category_subcategories
end
