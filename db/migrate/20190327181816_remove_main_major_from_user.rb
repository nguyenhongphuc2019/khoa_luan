class RemoveMainMajorFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :main_major, :integer
  end
end
