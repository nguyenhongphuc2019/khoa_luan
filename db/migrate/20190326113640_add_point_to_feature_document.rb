class AddPointToFeatureDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :feature_documents, :point, :integer
  end
end
