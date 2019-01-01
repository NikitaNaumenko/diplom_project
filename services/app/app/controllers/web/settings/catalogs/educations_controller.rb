# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class EducationsController < ApplicationController
        def index
          @educations = account.educations.ordered
          respond_to do |format|
            format.html
            format.json do
              render json: { skills: @skills }.to_json
            end
          end
        end

        def new; end

        def create
          education = account.educations.new(permitted_params)
          if education.save
            render json: { redirect_path: settings_catalogs_educations_path }.to_json
          else
            render json: { redirect_path: settings_catalogs_new_education_path,
                           errors: education.errors.full_messages.first }.to_json
          end
        end

        private

        def permitted_params
          params.require(:education).permit(:code, :name, :description)
        end
      end
    end
  end
end
