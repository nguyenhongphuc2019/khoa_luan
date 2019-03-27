class RemoveCategoryCareFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :category_care, :string
  end
end
