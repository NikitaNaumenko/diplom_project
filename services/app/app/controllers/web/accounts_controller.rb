# frozen_string_literal: true

module Web
  class AccountsController < ApplicationController
    skip_before_action :check_current_user

    def new
      return redirect_to root_path if current_user.guest?

      @account = AccountType.new
      @account.users.build
    end

    def create
      @account = AccountType.new(permitted_params)
      @account.users.first.email = @account.email
      if @account.save
        user = @account.users.first
        sign_in(user)
        flash[:success] = t('.notice', scope: :flash)
        respond_with @account, location: -> { root_path(account_name: @account.name) }
      else
        render 'new'
      end
    end

    def permitted_params
      params.require(:account).permit(:name, :email,
                                      users_attributes: %i[first_name password password_confirmation])
    end
  end
end
