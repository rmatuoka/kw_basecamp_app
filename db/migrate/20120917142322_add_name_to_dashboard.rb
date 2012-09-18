class AddNameToDashboard < ActiveRecord::Migration
  def self.up
    add_column :dashboards, :name, :string
  end

  def self.down
    remove_column :dashboards, :name
  end
end
