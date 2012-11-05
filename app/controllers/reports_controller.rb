class ReportsController < ApplicationController
  before_filter :basecamp_connect
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.find(params[:project_id])
    
    
  end
  
end
