class BusinessesController < ApplicationController
  before_action :store_referer, only: [:create, :update, :destroy]

  def create
    @business = current_user.businesses.build(business_params)
    if @business.save
      redirect_referer_or(current_user)
    end
  end
  
  def update
  end

  def destroy
  end

  private

    def business_params
      params.require(:business).permit(:name, :web_site, :my_page, :address, :details, :memo)
    end
end
