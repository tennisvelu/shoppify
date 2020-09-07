class CreateCategorySubcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :category_subcategories do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
