module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : (asset_path 'userpic.png')
  end
end
