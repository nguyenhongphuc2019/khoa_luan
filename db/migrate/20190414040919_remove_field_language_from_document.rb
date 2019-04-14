class RemoveFieldLanguageFromDocument < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :language, :integer
  end
end
