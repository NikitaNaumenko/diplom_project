# frozen_string_literal: true

module Web
  module Settings
    module Integrations
      module MoiKrug
        class CallbackUrlsController < Web::Settings::Integrations::MoiKrug::ApplicationController
          def index
            # TODO: for poddomens
            moi_krug_auth_code = permitted_params
            token = oauth_client.auth_code.
                      get_token(moi_krug_auth_code, redirect_uri: redirect_uri).
                      to_hash
            account.create_moi_krug_token(token.slice(:access_token))
            redirect_to settings_integrations_moi_krug_index_path, notice: t('.success')
          end

          private

          def permitted_params
            params.permit(:code).require(:code)
          end
        end
      end
    end
  end
end
