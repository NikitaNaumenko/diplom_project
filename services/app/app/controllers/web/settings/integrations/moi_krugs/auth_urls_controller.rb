# frozen_string_literal: true

module Web
  module MoiKrugs
    class AuthUrlsController < Web::MoiKrugs::ApplicationController
      def create
        render json: { uri: oauth_client.auth_code.authorize_url(redirect_uri: redirect_uri) }.to_json
      end
    end
  end
end
