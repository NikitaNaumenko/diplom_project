# frozen_string_literal: true

module Web
  module Settings
    class SkillsController < ::Web::Settings::ApplicationController
      def index
        @skills = account.skills
        respond_to do |format|
          format.html
          format.json do
            render json: { skills: @skills }.to_json
          end
        end
      end

      def new; end

      def create
        user = account.users.create(permitted_params)
        if user.create
          render json: { redirect_path: skills_path }.to_json
        end
      end

      private

      def permitted_params
        params.require(:skill).permit(:code, :name, :description)
      end
    end
  end
end
