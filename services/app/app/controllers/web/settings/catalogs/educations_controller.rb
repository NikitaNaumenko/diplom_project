# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class EducationsController < Web::Settings::Catalogs::ApplicationController
        def index
          @educations = account.educations.ordered
        end

        def new
          @education = account.educations.new
        end

        def create
          education = account.educations.create(permitted_params)
          respond_with education, location: -> { settings_catalogs_educations_path }
        end

        def edit
          @education = account.educations.find(params[:id])
        end

        def update
          education = account.educations.find(params[:id])
          education.update(permitted_params)
          respond_with education, location: -> { settings_catalogs_educations_path }
        end

        private

        def permitted_params
          params.require(:education).permit(:code, :name, :description)
        end
      end
    end
  end
end
