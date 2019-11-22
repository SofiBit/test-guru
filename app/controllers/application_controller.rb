class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password)
    end
  end

  def after_sign_in_path_for(current_user)
    current_user.admin? ? admin_tests_path : root_path
  end
end
