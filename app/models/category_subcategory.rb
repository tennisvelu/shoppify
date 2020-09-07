class CategorySubcategory < ApplicationRecord
  validates_uniqueness_of :category_id, :scope => :sub_category_id
  belongs_to :category
	
end
