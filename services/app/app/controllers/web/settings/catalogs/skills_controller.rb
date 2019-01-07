# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class SkillsController < ApplicationController
        def index
          @skills = account.skills.ordered
          respond_to do |format|
            format.html
            format.json do
              render json: { skills: @skills }.to_json
            end
          end
        end

        def new; end

        def create
          skill = account.skills.new(permitted_params)
          if skill.save
            render json: { redirect_path: settings_catalogs_skills_path }.to_json
          else
            render json: { redirect_path: new_settings_catalogs_skill_path,
                           errors: skill.errors.full_messages.first }.to_json
          end
        end

        private

        def permitted_params
          params.require(:skill).permit(:code, :name, :description)
        end
      end
    end
  end
end
