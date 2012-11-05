class AddTodoItemIdToTimeEntry < ActiveRecord::Migration
  def self.up
    add_column :time_entries, :todo_item_id, :integer
  end

  def self.down
    remove_column :time_entries, :todo_item_id
  end
end
