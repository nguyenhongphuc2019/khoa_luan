class CreateFeatureAttributesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_attributes_users do |t|
      t.references :user, foreign_key: true
      t.string :gender
      t.integer :birth_day
      t.string :state
      t.string :main_major

      t.timestamps
    end
  end
end
