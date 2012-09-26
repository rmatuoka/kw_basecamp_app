class AddDeletedToTodoItem < ActiveRecord::Migration
  def self.up
    add_column :todo_items, :deleted, :boolean, :default => 1
  end

  def self.down
    remove_column :todo_items, :deleted
  end
end
