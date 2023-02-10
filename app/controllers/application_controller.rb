class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: %i[index show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    users_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |param|
      param.permit(:name, :bio, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |param|
      param.permit(:name, :bio, :email, :password, :password_confirmation, :current_password)
    end
  end
end
