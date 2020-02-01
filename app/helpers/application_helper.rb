module ApplicationHelper

  def link_not_nil(link)
    link.nil? ? '#' : link
  end
  
  def class_status(status)
    case status
      when 0
        "panel-default"
      when 1
        "panel-success"
      else
        "panel-info"
    end
  end

  def text_status(status)
    case status
      when 0
        "未提出"
      when 1
        "選考待ち"
      else
        "確定"
    end
  end
  
  def schedule_date(schedule)
    date = "予定日: "
    if schedule.all_day
      date += schedule.first_date.strftime("%Y年%m月%d日")
      date += schedule.last_date.strftime(" ~ %Y年%m月%d日") unless schedule.last_date.nil?
    else
      date += schedule.first_date.strftime("%Y年%m月%d日 %H:%M:%S")
      date += schedule.last_date.strftime("%Y年%m月%d日 %H:%M:%S") unless schedule.last_date.nil?
    end
    date
  end
  
  def schedule_deadline(schedule)
    if schedule.deadline && !schedule.deadline_date.nil? && schedule.status == 0
      date = "締切日: "
      schedule.deadline_all_day ? date += schedule.deadline_date.strftime("%Y年%m月%d日") \
                                : date += schedule.deadline_date.strftime("%Y年%m月%d日 %H:%M:%S")
    end    
  end

  def schedule_selection(schedule)
    if schedule.selection && !schedule.selection_date.nil? && schedule.status != 2
      date = "選考日: "
      schedule.selection_all_day ? date += schedule.selection_date.strftime("%Y年%m月%d日") \
                                 : date += schedule.selection_date.strftime("%Y年%m月%d日 %H:%M:%S")
    end
  end
end
