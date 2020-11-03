module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : (asset_path 'userpic.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
