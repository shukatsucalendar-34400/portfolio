module CalendarHelper

  def setup_calendar
    set_today
    @current_month = @today.beginning_of_month
  end
  
  def current_month
    @current_month
  end
  
  def first_day(current_month = Time.new(2020, 1, 1, 0, 0, 0))
    first_day_of_month = @current_month.beginning_of_month
    first_day_of_month.beginning_of_week
  end
  
  def set_today
    @today = Time.zone.now
  end
  
  def day_cell_class(day_cell)
    (day_cell.month == @current_month.month && day_cell.year == @current_month.year) ? class_text="current": class_text="other"
    class_text+=" today" if (day_cell.day == @today.day && day_cell.month == @today.month && day_cell.year  == @today.year)
    class_text
  end
end
