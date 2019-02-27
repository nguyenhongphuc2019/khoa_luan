class AddTypeDocToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :type_doc, :string
  end
end
