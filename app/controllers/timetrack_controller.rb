class TimetrackController < ApplicationController
  before_filter :basecamp_connect
  
  def index
    @projects = Basecamp::Project.find(:all, :params => {:person_id => @me.id})
    
    #cookies.delete :timetracking
    #cookies.delete :datetracking
  end
  
  def new
    @isStart = false
    @item_id = params[:todo_item_id]
    
    
    
    #SETA COOKIES
    if !cookies[:timetracking] && !cookies[:datetracking]
      
      cookies[:timetracking] = { :value => @item_id, :expires => 2.day.from_now}
      cookies[:datetracking] = { :value => DateTime.now, :expires => 2.day.from_now}
      
      #POSTA NO BASECAMP
      c = Basecamp::Comment.new(:todo_item_id => @item_id)
      c.body = "Tarefa iniciada as: " + DateTime.now.strftime('%d/%m/%Y as %H:%M')
      c.save # => true
      
      @isStart = true
    else
      #VERIFICA SE É A MESMA TAREFA PARA PAUSAR
      puts "cookie = " + cookies[:timetracking]
      puts "item_id = " + @item_id
      
      
      if cookies[:timetracking] == @item_id
        #VALIDAR O MOTIVO
        @isValido = false
        @isValido = !params[:motivo].blank?
        
        if @isValido
          puts "é a mesma tarefa"
          
          #FINALIZA A TAREFA
          @isFinalizar = false
          
          if params[:finalizar].to_i > 0
            @isFinalizar = true
          end
          
          
          if @isFinalizar
            #todo_item = Basecamp::TodoItem.find(:all, :params => {:todo_item_id => @item_id})
            #todo_item.completed = true
            #todo_item.save
          end
          
          #POSTA NO BASECAMP
          c = Basecamp::Comment.new(:todo_item_id => @item_id)
          c.body = "Tarefa pausada as: " + DateTime.now.strftime('%d/%m/%Y as %H:%M')
          c.body += "<br><br><b>Motivo:</b> " + params[:motivo]
          c.save # => true

          #POSTA AS HORAS
          $horas = ((Time.parse(DateTime.now.to_s) - Time.parse(cookies[:datetracking].to_s)) / 3600).round(2)

          time_entry = Basecamp::TimeEntry.new(:todo_item_id => @item_id)
          time_entry.hours = $horas
          time_entry.date = Date.today
          time_entry.person_id = @me.id
          time_entry.save
          
          
          

          #LIMPA OS COOKIES
          cookies.delete :timetracking
          cookies.delete :datetracking
        else
          puts "Nao digitou o motivo"
        end
        
      else
        puts "não é a mesma tarefa"
      end
      
    end
    
  end
end
