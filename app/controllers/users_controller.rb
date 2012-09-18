class UsersController < ApplicationController
  before_filter :basecamp_connect, :except => [:new, :create]
  def index
    
  end
  
  def new
    
  end
  
  def create
    session[:username] = params[:username]
    session[:password] = params[:password]
    
    redirect_to timetrack_index_path
  end
end
