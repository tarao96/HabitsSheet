class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find(params[:id])
    
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, 'ログインしました。'
    else
      render :new
    end
  end
  
  privete
  
    def session_params
      params.require(:session).permit(:email, :password)
      
end
