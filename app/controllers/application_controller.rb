class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_actionでdeviseのストロングパラメーターにnameカラムを追加するメソッドを実行します。
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_notifications, if: :signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  def current_notifications
    # binding.pry
    @notifications_count = Notification.where(user_id: current_user.id).where(read: false).count
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
end
