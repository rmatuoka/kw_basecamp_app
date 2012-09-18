class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :todo_list_id
      t.integer :todo_list_item_id
      t.string :nome
      t.text :descricao
      t.string :repetir
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :person_id
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
