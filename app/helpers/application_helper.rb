module ApplicationHelper
  def user_at_step step  
    user = step.user
    image = if user.image.present?
      image_tag user.image, alt: user.full_name
    else
      image_tag 'default.png', alt: user.full_name
    end

    content_tag "span", image
  end
end
