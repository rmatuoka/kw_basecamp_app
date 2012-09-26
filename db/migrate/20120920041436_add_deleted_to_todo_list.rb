class AddDeletedToTodoList < ActiveRecord::Migration
  def self.up
    add_column :todo_lists, :deleted, :boolean, :default => 1
  end

  def self.down
    remove_column :todo_lists, :deleted
  end
end
