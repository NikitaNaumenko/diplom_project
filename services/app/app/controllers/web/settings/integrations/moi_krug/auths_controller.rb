# frozen_string_literal: true

module Web
  module Settings
    module Integrations
      module MoiKrug
        class AuthsController < ::Web::Settings::Integrations::MoiKrug::ApplicationController
          def show
            redirect_to oauth_client.auth_code.authorize_url(redirect_uri: ENV['MOI_KRUG_REDIRECT_URI'])
          end
        end
      end
    end
  end
end
