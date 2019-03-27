class AddFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :birth_day, :integer
    add_column :users, :status, :string
    add_column :users, :main_major, :integer
  end
end
