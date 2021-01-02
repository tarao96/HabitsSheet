class ApplicationController < ActionController::Base
 helper_method :current_user
 helper_method :current_task
 before_action :login_required
 
 private
 
 def current_user
     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 end
 
 def login_required
  redirect_to login_path unless current_user
 end
 
 def current_task
  @current_task = Task.find_by(id: session[:task_id]) 
 end
end
