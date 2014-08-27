class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_flash_notice(message)
    return if message.blank?

    flash[:notice] = message
  end

  def set_flash_error(message)
    return if message.blank?

    flash[:error] = message
  end

  def set_model_errors_in_flash(obj)
    return unless obj.present?

    errors = obj.errors.full_messages.join("\n")
    set_flash_error(errors)
  end

end
