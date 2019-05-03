# frozen_string_literal: true

module Web
  module Settings
    module Integrations
      class ApplicationController < ::ApplicationController
        def oauth_client
          @oauth_client ||= ::MoiKrug::OAuthClient.new(account.settings(:moi_krug)).call
        end

        def redirect_uri
          # moi_krug_callback_urls_url For production env
          ENV['MOI_KRUG_REDIRECT_URI']
        end
      end
    end
  end
end
