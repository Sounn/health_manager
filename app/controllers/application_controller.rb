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

  def after_sign_in_path_for(resource)#ログイン後の
    body = Body.where(user_id:current_user.id).last
    if body == nil
      flash[:positive] = "計測結果を入力してください。"
      bodies_new_path 
    end
    if body.created_at.strftime('%F') == Time.zone.now.strftime('%F')
      root_path
    else
      bodies_new_path #作成ページ
    end
  end
end
