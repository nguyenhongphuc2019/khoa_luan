class AddBackgroundToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :background, :string
  end
end
