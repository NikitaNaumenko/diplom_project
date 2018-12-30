# frozen_string_literal: true

module Web
  class AccountsController < ApplicationController
    layout 'account'

    def new
      @account = Account.new
      @account.users.build
    end

    def create
      @account = Account.new(permitted_params)
      if @account.save
        redirect_to users_path
      else
        render 'new'
      end
    end

    def permitted_params
      params.require(:account).permit(:name, :phone, :email, users_attributes: %i[first_name password password_confirmation])
    end
  end
end
