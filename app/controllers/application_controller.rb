class ApplicationController < ActionController::Base
  before_action :permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  private

  def permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
  end
  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "devise"
    end
  end
end
