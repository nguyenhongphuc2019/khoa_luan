class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.integer :keywordable_id
      t.string :keywordable_type

      t.timestamps
    end
  end
end
