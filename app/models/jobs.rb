class Jobs < ActiveRecord::Base
  attr_accessible :todo_list_id, :todo_list_item_id, :nome, :descricao, :repetir, :data_inicio, :data_fim, :person_id
end
