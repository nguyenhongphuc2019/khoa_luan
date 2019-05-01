class RemoveUserIdFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :user_id, :integer
  end
end
