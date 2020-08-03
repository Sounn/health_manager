module DeviseHelper
  def semantic_ui_message(key)
    case key
    when "alert"
      "warning"
    when "notice"
      "positive"
    when "error"
      "negative"
    else
      return key #deise以外のところはそのまま
    end
  end
end