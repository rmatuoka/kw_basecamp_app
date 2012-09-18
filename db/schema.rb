# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120918021818) do

  create_table "briefings", :force => true do |t|
    t.integer  "user_id"
    t.string   "task"
    t.string   "cliente"
    t.string   "nome_da_acao"
    t.string   "nome_da_peca"
    t.datetime "dead_line"
    t.string   "publicos"
    t.decimal  "budget",       :precision => 10, :scale => 0
    t.text     "objetivo"
    t.text     "formato"
    t.string   "midia"
    t.text     "conteudo"
    t.text     "descricao"
    t.text     "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "person_id"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "todo_list_id"
    t.integer  "todo_list_item_id"
    t.string   "nome"
    t.text     "descricao"
    t.string   "repetir"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
