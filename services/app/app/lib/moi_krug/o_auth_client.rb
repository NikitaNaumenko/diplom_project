# frozen_string_literal: true

module MoiKrug
  # Oauth client for moi krug api
  class OAuthClient
    def initialize(settings)
      @credentials = {
        url: ENV['MOI_KRUG_URL'],
        client_id: settings['client_id'],
        client_secret: settings['client_secret']
      }
    end

    def call
      OAuth2::Client.new(credentials[:client_id],
                         credentials[:client_secret],
                         site: credentials[:url],
                         token_url: '/integrations/oauth/token',
                         authorize_url: '/integrations/oauth/authorize')
    end

    private

    attr_reader :credentials
  end
end
