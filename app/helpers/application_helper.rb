module ApplicationHelper

  def control_group(&block)
    html = capture(&block) 

    if html.include? 'class="error"' then
      raw "<div class='control-group error'>#{html}</div>"
    else
      raw "<div class='control-group'>#{html}</div>"
    end
  end
end
