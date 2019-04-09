# frozen_string_literal: true

module Web
  class ApplicationController < ::ApplicationController
    include AuthHelper

    prepend_view_path Rails.root.join('frontend')
    before_action :check_current_user

    helper_method :account

    def account
      @account ||= Account.find_by(name: request.subdomain.presence || params[:account_name])
    end

    def check_current_user
      return unless current_user.guest?

      return redirect_to login_path(account_name: account.name) if account

      redirect_to new_account_path
    end
  end
end
