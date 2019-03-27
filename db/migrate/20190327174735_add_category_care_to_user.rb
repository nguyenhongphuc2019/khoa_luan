class AddCategoryCareToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :category_care, :string
  end
end
