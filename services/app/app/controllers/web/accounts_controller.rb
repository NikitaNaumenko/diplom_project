# frozen_string_literal: true

module Web
  class AccountsController < ApplicationController
    skip_before_action :check_current_user
    layout 'account'

    def new
      @account = Account.new
      @account.users.build
    end

    def create
      @account = Account.new(permitted_params)
      if @account.save
        render json: { redirect_path: users_path }.to_json
      else
        render 'new'
      end
    end

    def permitted_params
      params.require(:account).permit(:name, :email,
                                      users_attributes: %i[first_name email password password_confirmation])
    end
  end
end
