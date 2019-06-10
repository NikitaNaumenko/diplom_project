# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    skip_before_action :check_current_user

    def new
      redirect_to root_path if signed_in?
      @form = ::Users::LoginType.new
    end

    def create
      @form = ::Users::LoginType.new(params[:users_login_type].merge(account_id: account.id))
      user = @form.user
      if @form.authenticate_user?
        sign_in(user)
        flash[:success] = t('.notice', scope: :flash)
        redirect_to root_path
      else
        flash[:danger] = t('.alert', scope: :flash)
        render :new
      end
    end

    def destroy
      sign_out
      redirect_to root_url
    end
  end
end
