# frozen_string_literal: true

module Web
  module Users
    class ApplicationController < ::Web::ApplicationController
      def resource_user
        @resource_user ||= account.users.find(params[:user_id])
      end
    end
  end
end
