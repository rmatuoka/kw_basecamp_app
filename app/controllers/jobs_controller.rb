class JobsController < ApplicationController
  before_filter :basecamp_connect
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    @job.todo_list_id = params[:job][:todo_list_id]
    if @job.save
      
      #POSTA NO BASECAMP
      todo_item = Basecamp::TodoItem.new(:todo_list_id => @job.todo_list_id)
      todo_item.content = @job.nome
      todo_item.responsible_party = @job.person_id
      todo_item.notify = true
      todo_item.due_at = DateTime.now
      todo_item.save
      
      @job.todo_list_item_id = todo_item.id
      @job.save
      
      #POSTA COMENTÁRIO NO BASE
      c = Basecamp::Comment.new(:todo_item_id => @job.todo_list_item_id)
      c.body = @job.descricao
      c.save # => true
      
      redirect_to @job, :notice => "Successfully created job."
    else
      render :action => 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job, :notice  => "Successfully updated job."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, :notice => "Successfully destroyed job."
  end
end
