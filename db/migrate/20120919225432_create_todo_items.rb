class CreateTodoItems < ActiveRecord::Migration
  def self.up
    create_table :todo_items do |t|
      t.integer :todo_list_id
      t.integer :basecamp_id
      t.datetime :due_at
      t.string :content
      t.string :creator_name
      t.integer :responsible_party_id
      t.boolean :completed
      t.string :responsible_party_name
      t.datetime :commented_at
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_items
  end
end
