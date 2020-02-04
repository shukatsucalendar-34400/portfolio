class UsersController < ApplicationController
  include CalendarHelper

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :admin_user, only: [:index]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @businesses = @user.businesses
    @business = @user.businesses.build
    @schedule = @user.schedules.build
    begin
      if params[:current_month] 
        @current_month = Time.zone.parse(params[:current_month])
        session[:current_month] = params[:current_month]
      elsif session[:current_month]
        @current_month = Time.zone.parse(session[:current_month])
      else
        @current_month = @today.beginning_of_month
      end
    rescue
    end
    setup_calendar
    last_day_of_month = @first_day_of_month.since(6.weeks)
    schedules = Schedule.includes(:user, :business).where(user_id: @user.id) \
                                                   .where("(first_date BETWEEN ? AND ?) \
                                                           OR (last_date BETWEEN ? AND ?) \
                                                           OR ((first_date < ?) AND (last_date > ?))", \
                                                           @first_day_of_month, last_day_of_month, @first_day_of_month, last_day_of_month, @first_day_of_month, last_day_of_month)\
                                                   .order(:first_date)
    @schedule_ids = Array.new(42){ Array.new() }
    schedules.each do |schedule|
      set_date_from = ([ schedule.first_date, @first_day_of_month].max.to_date - @first_day_of_month.to_date).to_i
      if schedule.last_date.nil?
        set_date_to   = set_date_from
      else
        set_date_to = ([ schedule.last_date,  last_day_of_month - 1 ].min.to_date - @first_day_of_month.to_date).to_i
      end
      row = safety_transpose(@schedule_ids[set_date_from..set_date_to]).find_index{ |v| !v.compact.present? } \
            || safety_transpose(@schedule_ids[set_date_from..set_date_to]).length + 1
      business = schedule.business&.name
      @schedule_ids[set_date_from][row] = { id:       schedule.id, 
                                            length:   [(set_date_to - set_date_from + 1), 7 - set_date_from % 7].min, 
                                            name:     schedule.name, 
                                            business: business, 
                                            status:   schedule.status }
      ((set_date_from + 1)..set_date_to).each do |date|
        if date % 7 == 0
          @schedule_ids[date][row] = { id:       schedule.id, 
                                       length:   [(set_date_to - date + 1), 7].min, 
                                       name:     schedule.name, 
                                       business: business, 
                                       status:   schedule.status }
        else
          @schedule_ids[date][row] = { id: schedule.id }
        end
      end
    end
  end
  
  def index
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
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
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
