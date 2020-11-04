module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : (asset_path 'userpic.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def user_backcolor(user)
    user.background_color.present? ? user.background_color : (user.background_color = "#005A55")
  end
end
