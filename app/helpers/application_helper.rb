module ApplicationHelper
  def bootstrap_notice_mapper(type)
    case type
    when :alert
      "warning"
    when :error
      "error"
    when :notice
      "success"
    else
    "info"
    end
  end
end
