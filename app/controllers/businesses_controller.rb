class BusinessesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :store_referer,  only: [:create, :edit]
  before_action :correct_owner,  only: [:update, :destroy]

  def create
    @business = current_user.businesses.build(business_params)
    flash[:danger] = '不正な値です.' unless @business.save
    redirect_referer_or(current_user)
  end
  
  def edit
    @user = current_user
    @business = current_user.businesses.find_by(id: params[:id])
  end

  def update
    flash[:danger] = '不正な値です.' unless @business.update_attributes(business_params)
    if params[:submit_url] == "my_page"
      redirect_to (business_params[:my_page] || current_user)
    elsif params[:submit_url] == "web_site"
      redirect_to (business_params[:web_site] || current_user)
    else
      redirect_to edit_business_path(@business)
    end
  end

  def destroy
    @business.destroy
    redirect_referer_or(current_user)
  end

  private

    def business_params
      params.require(:business).permit(:name, :web_site, :my_page, :address, :details, :memo, :submit_url)
    end
    
    def correct_owner
      @business = current_user.businesses.find_by(id: params[:id])
      redirect_to current_user if @business.nil?
    end
end
