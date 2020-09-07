class Category < ApplicationRecord
  validates :name, uniqueness: true, :presence => true
  has_one :product_category
  has_one :product, through: :product_category
  has_many :category_subcategories
  has_many :sub_categories, through: :category_subcategories

  def self.sub_category(category)
    flattened = []
    category.sub_categories.each do |cat|
      if cat.sub_categories.present?
      	flattened << cat.name
        flattened.concat(sub_category(cat))
      else
        flattened << cat.name
      end
    end
    flattened
  end

end
