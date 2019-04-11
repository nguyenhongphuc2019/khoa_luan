class RemoveCategoryIdToFeatureCategoryDocument < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:categories, :feature_category_documents)
      remove_foreign_key :categories, :feature_category_documents
    end
  end
end
