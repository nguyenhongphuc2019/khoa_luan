class CreateFeatureUserDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_user_documents do |t|
      t.references :document, foreign_key: true
      t.string :gender
      t.string :generation
      t.string :status
      t.integer :point

      t.timestamps
    end
  end
end
