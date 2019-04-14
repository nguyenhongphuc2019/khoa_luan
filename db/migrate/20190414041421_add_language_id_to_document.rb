class AddLanguageIdToDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :language, foreign_key: true
  end
end
