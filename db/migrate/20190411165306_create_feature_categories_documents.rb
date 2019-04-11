class CreateFeatureCategoriesDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_categories_documents do |t|
      t.references :document, foreign_key: true
      t.string :main_major

      t.timestamps
    end
  end
end
