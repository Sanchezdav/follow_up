# frozen_string_literal: true

class ApplicationController < ActionController::Base
  default_form_builder BootstrapFormBuilder
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
