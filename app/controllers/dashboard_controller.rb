class DashboardController < ApplicationController
  before_filter :basecamp_connect
  
  def index
    @projects = Basecamp::Project.find(:all)
    @dashboards = Dashboard.all
  end
  
  def new
    @dashboard = Dashboard.new
    @dashboard.project_id = params[:project_id]
    @dashboard.person_id = params[:person_id]
    @dashboard.name = params[:name]
    @erro = 1
    
    if @dashboard.save
      @erro = 0
    end
    
  end
  
  def create
  end
  
end
