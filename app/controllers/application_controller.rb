class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  before_action :authenticate_user!, unless: :pages_controller?


  private

  def devise_or_pages_controller?
    devise_controller? || pages_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name << :name
      devise_parameter_sanitizer.for(:account_update) << :name << :first_name << :picture << :address << :phone << :competences
    end
end
