class BriefingsController < ApplicationController
  before_filter :basecamp_connect
  
  def index
    @briefings = Briefing.all
  
    
  end

  def show
    @briefing = Briefing.find(params[:id])
  end

  def new
    @briefing = Briefing.new
  end

  def create
    @briefing = Briefing.new(params[:briefing])
    if @briefing.save
      redirect_to @briefing, :notice => "Successfully created briefing."
      
      if !@briefing.task.blank?
        output = "<b>Nome do cliente:</b> #{@briefing.cliente }<br />" 
        output += "<b>Data:</b> #{@briefing.created_at }<br />"
        output += "<b>Nome da Ação:</b> #{@briefing.nome_da_acao }<br />"
        output += "<b>Nome da Peça:</b> #{@briefing.nome_da_peca }<br />"
        output += "<b>Dead-Line:</b> #{@briefing.dead_line }<br />"
        output += "<b>Públicos:</b> #{@briefing.publicos }<br />"
        output += "<b>Budget:</b> #{@briefing.budget }<br />"
        output += "<b>Objetivo:</b> #{@briefing.objetivo }<br />"
        output += "<b>Formato:</b> #{@briefing.formato }<br />"
        output += "<b>Mídia:</b> #{@briefing.midia }<br />"
        output += "<b>Conteúdo:</b> #{@briefing.conteudo }<br />"
        output += "<b>Descrição:</b> #{@briefing.descricao }<br />"
        output += "<b>Obervações:</b> #{@briefing.observacoes }<br />"
        
        c = Basecamp::Comment.new(:todo_item_id => @briefing.task)
        c.body = output
        c.save # => true

        #todo_items = []
        #  todo_lists = Basecamp::TodoList.find(:all, :params => { :project_id => 8095509 })
        #  todo_lists.each do |todo_list|
        #    puts "List name "  + todo_list.name
        #    todo_item = Basecamp::TodoItem.find(:all, :params => { :todo_list_id => todo_list.id })
        #    puts todo_item.object_id
        #  end
        #POSTA NO BASECAMP
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @briefing = Briefing.find(params[:id])
  end

  def update
    @briefing = Briefing.find(params[:id])
    if @briefing.update_attributes(params[:briefing])
      redirect_to @briefing, :notice  => "Successfully updated briefing."
      
      if !@briefing.task.blank?
        output = "<b>ATUALIZAÇÃO</b><br><br>"
        output += "<b>Nome do cliente:</b> #{@briefing.cliente }<br />" 
        output += "<b>Data:</b> #{@briefing.created_at }<br />"
        output += "<b>Nome da Ação:</b> #{@briefing.nome_da_acao }<br />"
        output += "<b>Nome da Peça:</b> #{@briefing.nome_da_peca }<br />"
        output += "<b>Dead-Line:</b> #{@briefing.dead_line }<br />"
        output += "<b>Públicos:</b> #{@briefing.publicos }<br />"
        output += "<b>Budget:</b> #{@briefing.budget }<br />"
        output += "<b>Objetivo:</b> #{@briefing.objetivo }<br />"
        output += "<b>Formato:</b> #{@briefing.formato }<br />"
        output += "<b>Mídia:</b> #{@briefing.midia }<br />"
        output += "<b>Conteúdo:</b> #{@briefing.conteudo }<br />"
        output += "<b>Descrição:</b> #{@briefing.descricao }<br />"
        output += "<b>Obervações:</b> #{@briefing.observacoes }<br />"
        
        c = Basecamp::Comment.new(:todo_item_id => @briefing.task)
        c.body = output
        c.save # => true

        #todo_items = []
        #  todo_lists = Basecamp::TodoList.find(:all, :params => { :project_id => 8095509 })
        #  todo_lists.each do |todo_list|
        #    puts "List name "  + todo_list.name
        #    todo_item = Basecamp::TodoItem.find(:all, :params => { :todo_list_id => todo_list.id })
        #    puts todo_item.object_id
        #  end
        #POSTA NO BASECAMP
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @briefing = Briefing.find(params[:id])
    @briefing.destroy
    redirect_to briefings_url, :notice => "Successfully destroyed briefing."
  end
end
