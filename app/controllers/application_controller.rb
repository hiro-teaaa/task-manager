class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :render_503, if: :maintenance_mode?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  def after_sign_in_path_for(resource)
    tasks_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  def maintenance_mode?
    ENV["MAINTENANCE_MODE"] == "true"
  end

  def render_503
    render(
      file: Rails.public_path.join("503.html"),
      content_type: "text/html",
      layout: false,
      status: :service_unavailable,
    )
  end
end
