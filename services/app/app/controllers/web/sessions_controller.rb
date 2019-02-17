# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    skip_before_action :check_current_user

    def new
      @form = Users::LoginType.new
    end

    def create
      user = account.users.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { redirect_path: root_path }.to_json
      else
        render json: { redirect_path: login_path }.to_json
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url
    end
  end
end
