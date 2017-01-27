module ApplicationHelper
  def user_avatar user
    if user.image.present?
      image_tag user.image
    else
      image_tag 'default.png'
    end
  end
end
