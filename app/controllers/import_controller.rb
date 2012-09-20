class ImportController < ApplicationController
  def index
    puts "CONECTANDO"
    connect = Basecamp.establish_connection!(BASECAMP_URL, "rmatuoka", "rafael11", true)
    
    puts "CARREGANDO TODOS OS PROJETOS DO BASE"
    @base_projects = Basecamp::Project.find(:all)
    
    
    @base_projects.each do |project|
      puts "ATUALIZANDO PROJETO => " + project.name + " - " + project.id.to_s
      #para cada projeto, verifica se existe no banco, se sim atualiza, se nao grava
      check_project = Project.first(:conditions => ['basecamp_id = ?', project.id])
      
      if check_project
        #existe
        puts "PROJETO EXISTENTE, ATUALIZANDO"
        @project = check_project
      else
        #não Existe
        puts "NOVO PROJETO, SALVANDO"
        @project = Project.new
      end
      
      @project.basecamp_id = project.id
      @project.name = project.name
      @project.status = project.status
      
      #puts project.status
      if @project.save
        puts @project.name + " SALVO"
      end
      
      
      #---------------------------------------------- TODO LIST
      puts "CARREGANDO TODAS AS TODO LISTS DO PROJETO " + @project.name
      @base_todo_lists = Basecamp::TodoList.find(:all, :params => { :project_id => @project.basecamp_id})
      
        @base_todo_lists.each do |todo_list|
          puts "ATUALIZANDO TODO LIST => " + todo_list.name + " - " + todo_list.id.to_s
          
          #para cada todo list, verifica se existe no banco, se sim atualiza, se nao grava
          check_todo_list = TodoList.first(:conditions => ['basecamp_id = ?', todo_list.id])

          if check_todo_list
            #existe
            puts "TODO LIST EXISTENTE, ATUALIZANDO"
            @todo_list = check_todo_list
          else
            #não Existe
            puts "NOVA TODO LIST, SALVANDO"
            @todo_list = TodoList.new
          end

          @todo_list.project_id = project.id
          @todo_list.basecamp_id = todo_list.id
          @todo_list.name = todo_list.name
          @todo_list.completed = todo_list.completed
          @todo_list.description = todo_list.description

          if @todo_list.save
            puts @todo_list.name + " SALVO"
          end
          
          #---------------------------------------------- TODO ITEM
          puts "CARREGANDO TODAS AS TODO ITEMS DA LISTA " + @todo_list.name
          @base_todo_items = Basecamp::TodoItem.find(:all, :params => { :todo_list_id => todo_list.id})

            @base_todo_items.each do |todo_item|
              puts "ATUALIZANDO TODO ITEM => " + todo_item.content + " - " + todo_item.id.to_s

              #para cada todo item, verifica se existe no banco, se sim atualiza, se nao grava
              check_todo_item = TodoItem.first(:conditions => ['basecamp_id = ?', todo_item.id])

              if check_todo_item
                #existe
                puts "TODO ITEM EXISTENTE, ATUALIZANDO"
                @todo_item = check_todo_item
              else
                #não Existe
                puts "NOVA TODO ITEM, SALVANDO"
                @todo_item = TodoItem.new
              end

              @todo_item.todo_list_id = @todo_list.id
              @todo_item.basecamp_id = todo_item.id
              @todo_item.due_at = todo_item.attributes[:due_at]
              @todo_item.content = todo_item.attributes[:content]
              @todo_item.creator_name = todo_item.attributes[:creator_name]
              @todo_item.responsible_party_id = todo_item.attributes[:responsible_party_id]
              @todo_item.completed = todo_item.attributes[:completed]
              @todo_item.responsible_party_name = todo_item.attributes[:responsible_party_name]
              @todo_item.commented_at = todo_item.attributes[:commented_at]
              @todo_item.creator_id = todo_item.attributes[:creator_id]



              if @todo_item.save
                puts @todo_item.content + " SALVO"
              end
            end
          #---------------------------------------------- TODO ITEM
          
        end
      #---------------------------------------------- TODO LIST
      
      
      
      
    end

  end
end
