class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_request_variant
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # user-agent
  def request_from_smartphone?
    Woothee.parse(request.user_agent)[:category] == :smartphone
  end

  def set_request_variant
    request.variant = (request_from_smartphone? ? :sp : :pc)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
