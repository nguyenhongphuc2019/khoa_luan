class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.integer :total_view
      t.integer :total_dowload
      t.string :author_name
      t.string :source_file

      t.timestamps
    end
  end
end
