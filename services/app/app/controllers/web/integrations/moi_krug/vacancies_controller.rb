# frozen_string_literal: true

module Web
  module Integrations
    module MoiKrug
      class VacanciesController < ::Web::Integrations::ApplicationController
        def index
          request = client.vacancies
          if request.success?
            @vacancies = client.vacancies.body[:vacancies]
          else
            redirect_to root_path, alert: request.response.message
          end
        end

        def new
          @vacancy = Vacancy.new
        end

        def create
          permitted_params = params.require(:vacancy)
          client.create_vacancy(options: permitted_params)
        end

        def responses
          @responses = client.responses.body
        end

        def publish
          client.publish_vacancy(vacancy_id: params[:id])
        end
      end
    end
  end
end
