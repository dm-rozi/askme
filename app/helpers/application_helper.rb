module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : (asset_path 'userpic.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def question_author(question)
    question.author.present? ? (link_to "@#{question.author.username}", user_path(question.author.id)) : ("Анон")
  end
end

# <%= link_to "@#{current_user.username}", user_path(current_user) %>