class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :basecamp_id
      t.string :name
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
