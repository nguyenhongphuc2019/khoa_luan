class AddVerbToKeywords < ActiveRecord::Migration[5.2]
  def change
    add_reference :keywords, :verb, foreign_key: true
  end
end
