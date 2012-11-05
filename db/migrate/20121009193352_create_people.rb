class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :avatar_url
      t.string :first_name
      t.boolean :deleted
      t.string :im_handle
      t.string :phone_number_home
      t.string :email_address
      t.string :im_service
      t.string :last_name
      t.integer :basecamp_id
      t.boolean :administrator

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
