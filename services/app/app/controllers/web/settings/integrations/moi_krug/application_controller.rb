# frozen_string_literal: true

module Web
  module Settings
    module Integrations
      module MoiKrug
        class ApplicationController < ::Web::ApplicationController
          def oauth_client
            @oauth_client ||= ::MoiKrug::OAuthClient.new(account.moi_krug_secrets.last.slice('client_id', 'client_secret')).call
          end

          def redirect_uri
            # moi_krug_callback_urls_url For production env
            ENV['MOI_KRUG_REDIRECT_URI']
          end
        end
      end
    end
  end
end
