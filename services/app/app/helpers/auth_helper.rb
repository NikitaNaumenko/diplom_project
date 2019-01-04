# frozen_string_literal: true

module AuthHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    session[:user_id] && User.find_by(id: session[:user_id])
  end

  def authenticate_user!
    redirect_to new_sessions_path unless signed_in?
  end

  def sign_out
    session[:user_id] = nil
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
