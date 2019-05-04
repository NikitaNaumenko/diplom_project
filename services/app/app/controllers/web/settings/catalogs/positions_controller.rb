# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class PositionsController < ApplicationController
        def index
          @positions = account.positions.ordered
        end

        def new
          @position = account.positions.new
        end

        def create
          position = account.positions.create(permitted_params)
          respond_with position, location: -> { settings_catalogs_positions_path }
        end

        def edit
          @position = account.positions.find(params[:id])
        end

        def update
          position = account.positions.find(params[:id])
          position.update(permitted_params)
          respond_with position, location: -> { settings_catalogs_positions_path }
        end

        private

        def permitted_params
          params.require(:position).permit(:code, :name, :description)
        end
      end
    end
  end
end
