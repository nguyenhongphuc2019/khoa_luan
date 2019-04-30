class RemoveDisabledFromDocument < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :disabled, :boolean
  end
end
