# frozen_string_literal: true

module Web
  class UsersController < ApplicationController
    helper_method :resource_user

    def index
      @users = account.users
      respond_to do |format|
        format.html
        format.json do
          render json: { users: @users }.to_json
        end
      end
    end

    def show; end

    def new; end

    def create
      respond_to do |format|
        format.json do
          user = account.users.create(permitted_params)
          render json: { redirect_path: user_path(user) }.to_json
        end
      end
    end

    def edit; end

    def update
      resource_user.update(permitted_params)
      respond_with resource_user, location: -> { user_path(resource_user) }
    end

    private

    def resource_user
      @resource_user ||= account.users.find(params[:id])
    end

    def permitted_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   :patronymic, :birthdate, :work_state, :employee_number, :photo,
                                   :citizenship, :birthplace, :gender, :marital_status)
    end
  end
end
