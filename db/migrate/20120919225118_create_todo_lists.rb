class CreateTodoLists < ActiveRecord::Migration
  def self.up
    create_table :todo_lists do |t|
      t.integer :project_id
      t.integer :basecamp_id
      t.boolean :completed
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_lists
  end
end
