class AddCategoryIdToFeatureCategoryDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :feature_category_documents, :category, foreign_key: true
  end
end
