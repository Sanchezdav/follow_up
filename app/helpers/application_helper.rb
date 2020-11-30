# frozen_string_literal: true

module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'alert-primary',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def current_path?(current_path)
    return 'active' if request.path == current_path

    ''
  end

  def user_nickname(user)
    user.username || user.name.mentionable || user.email.split('@')[0]
  end

  def formatted_date(date)
    date.strftime('%B %d, %Y')
  end
end
