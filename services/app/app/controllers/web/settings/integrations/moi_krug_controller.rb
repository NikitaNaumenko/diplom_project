# frozen_string_literal: true

module Web
  module Settings
    module Integrations
      class MoiKrugController < ::Web::Settings::Integrations::ApplicationController
        def index
          @moi_krug_secrets = account.moi_krug_secrets
          @token = account.moi_krug_token
        end

        def ping
          secrets = account.moi_krug_secrets.last.attributes.slice('client_id', 'client_secret')
          @oauth_client = ::MoiKrug::OAuthClient.new(secrets).call
        end

        def new
          @moi_krug_secret = account.moi_krug_secrets.new
        end

        def create
          @moi_krug_secret = account.moi_krug_secrets.create(permitted_params)
          respond_with @moi_krug_secret, location: -> { settings_integrations_moi_krug_index_path }
        end

        def edit
          @moi_krug_secret = account.moi_krug_secrets.find(params[:id])
        end

        def update
          @moi_krug_secret = account.moi_krug_secrets.find(params[:id])
          @moi_krug_secret.update(permitted_params)
          respond_with @moi_krug_secret, location: -> { settings_integrations_moi_krug_index_path }
        end

        private

        def permitted_params
          params.require(:account_moi_krug_secret).permit(:client_id, :client_secret)
        end
      end
    end
  end
end
