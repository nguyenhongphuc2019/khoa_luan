class RemoveLanguageIdFromDocument < ActiveRecord::Migration[5.2]
  def change
    remove_reference :documents, :language, foreign_key: true
  end
end
