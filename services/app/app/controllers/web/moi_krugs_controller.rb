# frozen_string_literal: true

module Web
  class MoiKrugsController < ApplicationController
    def index
      moi_krug_settings
    end

    def new
      moi_krug_settings
    end

    def create
      moi_krug_settings.update(permitted_params)
      render json: { redirect_path: moi_krugs_path }
    end

    private

    def permitted_params
      params.require(:moi_krug).permit(:client_id, :client_secret)
    end

    def moi_krug_settings
      @moi_krug_settings ||= account.settings(:moi_krug)
    end
  end
end
