class AddPersonIdToDashboard < ActiveRecord::Migration
  def self.up
    add_column :dashboards, :person_id, :integer
  end

  def self.down
    remove_column :dashboards, :person_id
  end
end
