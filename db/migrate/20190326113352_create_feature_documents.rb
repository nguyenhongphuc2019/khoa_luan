class CreateFeatureDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_documents do |t|
      t.references :document, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end