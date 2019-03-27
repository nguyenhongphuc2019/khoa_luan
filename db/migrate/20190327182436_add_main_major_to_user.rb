class AddMainMajorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :main_major, :string
  end
end
