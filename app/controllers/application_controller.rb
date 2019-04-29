class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :set_global_search_variable

  def set_current_user
    User.current = current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :gender, :birth_day, :state, {main_major: []} ])
  end

  def set_global_search_variable
    @q = Document.search(params[:q])
  end
end
