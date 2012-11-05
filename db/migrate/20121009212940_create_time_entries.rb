class CreateTimeEntries < ActiveRecord::Migration
  def self.up
    create_table :time_entries do |t|
      t.integer :basecamp_person_id
      t.datetime :date
      t.decimal :hours, :precision => 10, :scale => 2, :default => 0
      t.string :person_name
      t.integer :basecamp_id
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :time_entries
  end
end
