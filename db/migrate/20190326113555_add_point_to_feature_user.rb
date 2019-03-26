class AddPointToFeatureUser < ActiveRecord::Migration[5.2]
  def change
    add_column :feature_users, :point, :integer
  end
end
