class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !user
      flash.now[:danger] = 'アカウントが見つかりません'
      render 'new'
    elsif !user.authenticate(params[:session][:password])
      flash.now[:danger] = 'パスワードが正しくありません'
      render 'new'        
    else
      log_in user
      redirect_to user
    end    
  end
  
  def destroy
  end
end
