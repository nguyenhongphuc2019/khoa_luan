class AddGroupToVerbs < ActiveRecord::Migration[5.2]
  def change
    add_column :verbs, :group, :integer
  end
end
