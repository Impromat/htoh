class UsersController < ApplicationController

  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def profile
    @user = User.find(params[:user_id])
    authorize @user
  end

end
