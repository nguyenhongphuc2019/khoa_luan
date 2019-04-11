class RemoveFieldAgeFromFeatureDocument < ActiveRecord::Migration[5.2]
  def change
    remove_column :feature_documents, :age, :integer
  end
end
