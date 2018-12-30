# frozen_string_literal: true

# Main controller
class ApplicationController < ActionController::Base
  include AuthHelper

  protect_from_forgery with: :exception
  prepend_view_path Rails.root.join('frontend')
  before_action :check_current_user

  def account
    @account ||= Account.find_by(name: request.subdomain.presence || params[:account_name])
  end

  def check_current_user
    return redirect_to login_path unless current_user
  end
end
