class AddCommentsCountToTodoItem < ActiveRecord::Migration
  def self.up
    add_column :todo_items, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :todo_items, :comments_count
  end
end
