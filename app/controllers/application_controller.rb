class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def basecamp_connect
    if session[:username] && session[:password]
      connect = Basecamp.establish_connection!(BASECAMP_URL, session[:username], session[:password], true)
      
      @base_me = Basecamp::Person.me
      
      @me = Person.first(:conditions => ['basecamp_id = ?', @base_me.id])
      
    else
      redirect_to new_user_path
    end
  end
end
