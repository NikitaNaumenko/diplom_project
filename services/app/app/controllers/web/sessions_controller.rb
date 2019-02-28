# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    skip_before_action :check_current_user

    def new
      redirect_to root_path if signed_in?
      @user = Users::LoginType.new
    end

    def create
      @user = account.users.find_by(email: params[:email])
      if @user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render 'new'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url
    end
  end
end
