class AddLanguageToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :language, :integer
  end
end
