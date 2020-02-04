class BusinessesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :index, :destroy]
  before_action :store_referer,  only: [:create]
  before_action :correct_owner,  only: [:edit, :update, :destroy]

  def create
    @business = current_user.businesses.build(business_params)
    flash[:danger] = '不正な値です.' unless @business.save
    redirect_referer_or('#')
  end
  
  def edit
    @user = current_user
    @businesses = @user.businesses
    @schedules = @current_business.schedules
    @schedule = @current_business.schedules.build
  end

  def update
    flash[:danger] = '不正な値です.' unless @current_business.update_attributes(business_params)
    if params[:submit_url] == "my_page"
      redirect_to (business_params[:my_page] || current_user)
    elsif params[:submit_url] == "web_site"
      redirect_to (business_params[:web_site] || current_user)
    else
      redirect_to edit_business_path(@current_business)
    end
  end
  
  def index
    @user = current_user
    @businesses = @user.businesses
    @business = @user.businesses.build
    @schedule = @user.schedules.build
  end
  
  def destroy
    @current_business.destroy
    redirect_to businesses_path
  end

  private

    def business_params
      params.require(:business).permit(:name, :web_site, :my_page, :address, :details, :memo, :submit_url)
    end
    
    def correct_owner
      @current_business = current_user.businesses.find_by(id: params[:id])
      redirect_to current_user if @current_business.nil?
    end
end
