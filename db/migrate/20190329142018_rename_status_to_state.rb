class RenameStatusToState < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :status, :state
  end
end
