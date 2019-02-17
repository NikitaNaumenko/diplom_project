# frozen_string_literal: true

module Web
  class AccountsController < ApplicationController
    skip_before_action :check_current_user

    def new
      @form = AccountType.new
      @form.users.build
    end

    def create
      @account = Account.new(permitted_params)
      if @account.save
        render json: { redirect_path: users_path }.to_json
      else
        render json: { redirect_path: new_account_path, errors: @account.errors.full_messages }
      end
    end

    def permitted_params
      params.require(:account).permit(:name, :email,
                                      users_attributes: %i[first_name email password password_confirmation])
    end
  end
end
