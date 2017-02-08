module ApplicationHelper
  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success bg-success',
    error: 'alert-error bg-warning',
    alert: 'alert-block bg-danger',
    notice: 'alert-info bg-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def bootstrap_icon_for flash_type
    { success: "ok-circle", error: "remove-circle", alert: "warning-sign", notice: "exclamation-sign" }[flash_type] || "question-sign"
  end
end
