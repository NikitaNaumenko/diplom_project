# frozen_string_literal: true

module Web
  module Settings
    module Catalogs
      class DepartmentsController < Web::Settings::Catalogs::ApplicationController
        def index
          @departments = account.departments.ordered
        end

        def new
          @department = account.departments.new
        end

        def create
          department = account.departments.create(permitted_params)
          respond_with department, location: -> { settings_catalogs_departments_path }
        end

        def edit
          @department = account.departments.find(params[:id])
        end

        def update
          department = account.departments.find(params[:id])
          department.update(permitted_params)
          respond_with department, location: -> { settings_catalogs_departments_path }
        end

        private

        def permitted_params
          params.require(:department).permit(:code, :name, :description)
        end
      end
    end
  end
end
