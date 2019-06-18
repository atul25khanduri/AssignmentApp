module ApplicationHelper
  def change_text_to_html(msg)
    return msg if msg.is_a? String
    return '' unless msg.is_a? Array
    return msg.first if msg.count == 1

    html_msg = ''
    html_msg.concat "<ul>"

    msg.each do |m|
      html_msg.concat "<li class='text-left'>#{m}</li>"
    end

    html_msg.concat "</ul>"
  end
end
