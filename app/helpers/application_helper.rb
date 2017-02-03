module ApplicationHelper
  def user_avatar user
    image = if user.image.present?
      image_tag user.image, alt: user.full_name
    else
      image_tag 'default.png', alt: user.full_name
    end
    content_tag "span", image
  end

  def user_at_step step
    user = step.user
    user_avatar user
  end

  def md(text)
    options = {
      escape_html:     true,
      hard_wrap:       false,
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      superscript: true,
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
