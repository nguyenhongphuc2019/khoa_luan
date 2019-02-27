class AddImageToDocument < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :image, :string
  end
end
