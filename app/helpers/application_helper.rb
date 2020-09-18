module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: "alert-primary",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
