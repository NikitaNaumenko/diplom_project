# frozen_string_literal: true

module Web
  module Integrations
    class ApplicationController < ::Web::ApplicationController
      def client
        @client ||= Kruger::Client.new(access_token: account.moi_krug_token.token)
      end
    end
  end
end
