class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if !@user
      flash.now[:danger] = 'アカウントが見つかりません'
      render 'new'
    elsif !@user.activated?
      flash.now[:danger] = 'アカウントが有効化されていません. 登録したメールを確認してください'
      render 'new'
    elsif !@user.authenticate(params[:session][:password])
      flash.now[:danger] = 'パスワードが正しくありません'
      render 'new'
    else
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    end    
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
  
  private
  
    def logged_in_user
      redirect_to current_user if logged_in?
    end
end
