module ApplicationHelper

  def control_group(&block)
    html = capture(&block) 

    if html.include? 'class="error"' then
      raw "<div class='control-group error'>#{html}</div>"
    else
      raw "<div class='control-group'>#{html}</div>"
    end
  end

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end


  def avatar_image(user)
    raw image_tag( 
        avatar_url(user), 
        :alt => user.nickname, 
        :title => user.nickname, 
        :id => "user_#{user.id}_img",  
        :class => "user_img",  
     )
  end


end
