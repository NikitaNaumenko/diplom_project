# frozen_string_literal: true

module Api
  class UsersController < Api::ApplicationController
    skip_before_action :authenticate_request, only: %i[login register]

      def login
    authenticate params[:email], params[:password]
  end
  def test
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end
    def register
      @user = User.create(user_params)
      if @user.save
        response = { message: 'User created successfully'}
        render json: response, status: :created 
      else
         render json: @user.errors, status: :bad
      end
    end


    private

    def user_params
      params.permit(:email, :password)
    end

      def authenticate(email, password)
    command = Users::Authenticate.call(email: email, password: password)
    puts command

    if command.success?
      render json: {
        access_token: command.token,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end
  end
end
