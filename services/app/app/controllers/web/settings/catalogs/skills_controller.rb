# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class SkillsController < Web::Settings::Catalogs::ApplicationController
        def index
          @skills = account.skills.ordered
        end

        def new
          @skill = account.skills.new
        end

        def create
          skill = account.skills.create(permitted_params)
          respond_with skill, location: -> { settings_catalogs_skills_path }
        end

        def edit
          @skill = account.skills.find(params[:id])
        end

        def update
          skill = account.skills.find(params[:id])
          skill.update(permitted_params)
          respond_with skill, location: -> { settings_catalogs_skills_path }
        end

        private

        def permitted_params
          params.require(:skill).permit(:code, :name, :description)
        end
      end
    end
  end
end
