class CreateBriefings < ActiveRecord::Migration
  def self.up
    create_table :briefings do |t|
      t.integer :user_id
      t.string :task
      t.string :cliente
      t.string :nome_da_acao
      t.string :nome_da_peca
      t.datetime :dead_line
      t.string :publicos
      t.decimal :budget
      t.text :objetivo
      t.text :formato
      t.string :midia
      t.text :conteudo
      t.text :descricao
      t.text :observacoes
      t.timestamps
    end
  end

  def self.down
    drop_table :briefings
  end
end
