# frozen_string_literal: true

module Web
  module MoiKrugs
    class CallbackUrlsController < Web::MoiKrugs::ApplicationController
      def index
        # TODO: for poddomens
        @account = Account.first
        moi_krug_auth_code = permitted_params
        token = oauth_client.auth_code.
                  get_token(moi_krug_auth_code, redirect_uri: redirect_uri).
                  to_hash
        account.create_moi_krug_token(token.slice(:access_token))
        redirect_to moi_krugs_path
      end

      private

      def permitted_params
        params.permit(:code).require(:code)
      end
    end
  end
end
