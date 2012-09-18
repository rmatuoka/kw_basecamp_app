class Briefing < ActiveRecord::Base
  attr_accessible :user_id, :task, :cliente, :nome_da_acao, :nome_da_peca, :dead_line, :publicos, :budget, :objetivo, :formato, :midia, :conteudo, :descricao, :observacoes
end
