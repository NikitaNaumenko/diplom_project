# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    include Responders
    include ExceptionHandler

    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
      @current_user = AuthorizeApiRequest.call(headers: request.headers).user
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def account
      @account ||= Account.find_by(name: request.subdomain)
    end
  end
end
