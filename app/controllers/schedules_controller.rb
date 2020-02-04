class SchedulesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :store_referer,  only: [:create]
  before_action :correct_owner,  only: [:edit, :update, :destroy]
  
  def create
    @schedule = current_user.schedules.build(schedule_params)
    flash[:danger] = '不正な値です.' unless @schedule.save
    redirect_referer_or('#')
  end
  
  def edit
    @user = current_user
  end

  def update
    flash[:danger] = '不正な値です.' unless @schedule.update_attributes(business_params)
    redirect_to edit_business_path(@business)
  end
  
  def destroy
    @schedule.destroy
    redirect_to edit_business_path(@business)
  end
  
  def ajax_select_business
    @select_business = Business.find(params[:id])
  end

  private

    def schedule_params
      params.require(:schedule).permit(:name, :status, :business_id, \
                                       :first_date, :last_date, :all_day, \
                                       :deadline, :deadline_date, :deadline_all_day,\
                                       :selection, :selection_date, :selection_all_day)
    end
    
    def correct_owner
      @schedule = current_user.schedules.find_by(id: params[:id])
      redirect_to current_user if @schedule.nil?
    end
end
