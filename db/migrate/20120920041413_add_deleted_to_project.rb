class AddDeletedToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :deleted, :boolean, :default => 1
  end

  def self.down
    remove_column :projects, :deleted
  end
end
