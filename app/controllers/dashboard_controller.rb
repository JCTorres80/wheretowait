class DashboardController < ApplicationController
  before_filter :verify_credentials

  def index
    @user = current_user
  end

  private

  def verify_credentials
    # first check if anyone is even checked in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: t(:Need_to_sign_in)
      return
    end
    #unless current_user.role=='admin'
    #  redirect_to root_path, notice: t(:Need_permissions)
    #end
  end

end
