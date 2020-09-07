class CategorySubcategory < ApplicationRecord
  validates_uniqueness_of :category_id, :scope => :sub_category_id
  belongs_to :category
  belongs_to :sub_category, :class_name => "Category", :foreign_key => "sub_category_id"	
  validate :check_category

  def check_category
    errors.add(:field, 'error message') if self.category_id == self.sub_category_id
  end
end
