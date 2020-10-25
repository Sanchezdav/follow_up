module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: "alert-primary",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def current_path?(current_path)
    return 'active' if request.path == current_path

    ''
  end

  def user_nickname(user)
    user.username || user.name.mentionable || user.email.split('@')[0]
  end

  def user_avatar(user:, size:)
    if user.avatar.attached?
      image_tag(user.avatar.variant(combine_options: {
        resize_to_limit: [size*2, size*2]
      }), height: size, width: size, class: 'rounded-circle')
    else
      image_tag('avatar.png', height: size, width: size, class: 'rounded-circle')
    end
  end
end
