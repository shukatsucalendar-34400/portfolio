module ApplicationHelper

  def link_not_nil(link)
    link.nil? ? '#' : link
  end
end
