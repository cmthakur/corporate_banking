class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  def current_active_bank
    @current_user = current_user
  end

  def current_active_member
    @current_member = current_member
  end

  private

  def require_login
     @current_user || @current_member
     rescue
    reset_session
  end
end