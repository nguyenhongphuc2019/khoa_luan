class AddGenerationToFeatureDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :feature_documents, :generation, :string
  end
end
