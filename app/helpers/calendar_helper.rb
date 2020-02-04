module CalendarHelper

  def setup_calendar
    set_today
    first_day(@current_month)
    @today_id = (@today.to_date - @first_day_of_month.to_date).to_i
  end
  
  def current_month
    @current_month
  end
  
  def first_day(current_month = Time.new(2020, 1, 1, 0, 0, 0))
    @first_day_of_month = current_month.beginning_of_month.beginning_of_week
  end
  
  def set_today
    @today = Time.zone.now
  end
  
  def cell_day_class(cell_day)
    (cell_day.month == @current_month.month && cell_day.year == @current_month.year) ? class_text="current": class_text="other"
    class_text+=" today" if (cell_day.day == @today.day && cell_day.month == @today.month && cell_day.year  == @today.year)
    class_text
  end
  
  def cell_row_length(cell_row)
    date = cell_row * 7
    [ @schedule_ids[date..(date+6)].max_by(&:length)&.length, 3].max || 3
  end
  
  def cell_class(status)
    case status
    when 0
      "my_label label-default cell"
    when 1
      "my_label label-success cell"
    when nil
      "none-border"
    else
      "my_label label-info cell"
    end
  end
  
  private
    def safety_transpose(array)
      length_max = array.max_by{ |v| v.length }.length
      array.each { |v| v[length_max-1] = nil if v.length < length_max }
      array.transpose
    end
end
