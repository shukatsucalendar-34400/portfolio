class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :admin_user, only: [:index]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #@user.send_activation_email
      flash[:success] = "登録したアドレスを確認し、アカウントを有効化してください。"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to root_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
