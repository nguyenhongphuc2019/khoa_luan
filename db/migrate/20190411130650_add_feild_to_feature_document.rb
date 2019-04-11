class AddFeildToFeatureDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :feature_documents, :gender, :string
    add_column :feature_documents, :age, :integer
    add_column :feature_documents, :status, :string
  end
end
