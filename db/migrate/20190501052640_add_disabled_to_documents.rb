class AddDisabledToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :disabled, :boolean, default: false
  end
end
