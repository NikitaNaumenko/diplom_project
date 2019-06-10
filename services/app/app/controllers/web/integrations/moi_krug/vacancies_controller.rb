# frozen_string_literal: true

module Web
  module Integrations
    module MoiKrug
      class VacanciesController < ::Web::Integrations::ApplicationController
        def index
          @vacancies = {
            "vacancies": [
              {
                "id": 19,
                "title": 'Вакансия 1',
                "published_at": '2017-07-25T18:46:24.159+03:00',
                "url": 'https://moikrug.ru/vacancies/19',
                "location": 'Россия, Москва',
                "city": 'Москва',
                "marked": false,
                "company": {
                  "name": 'Компания 1',
                  "alias_name": 'company1',
                  "url": 'https://moikrug.ru/companies/company1',
                  "logo_url": 'https://hsto.org/getpro/moikrug/uploads/company/348/850/484/logo/medium_cd41dce48c924bbcd134b5a8aac27be1.png'
                },
                "employment_type": 'Полный рабочий день',
                "salary": 'от 50 000 до 60 000 руб.'
              },
              {
                "id": 16,
                "title": 'Вакансия 2',
                "published_at": '2017-07-31T00:00:45.321+03:00',
                "url": 'https://moikrug.ru/vacancies/16',
                "location": 'Россия, Москва',
                "city": 'Москва',
                "marked": false,
                "company": {
                  "name": 'Компания 2',
                  "alias_name": 'company2',
                  "url": 'https://moikrug.ru/companies/company2',
                  "logo_url": 'https://hsto.org/getpro/moikrug/uploads/company/348/850/484/logo/medium_cd41dce48c924bbcd134b5a8aac27be1.png'
                },
                "employment_type": 'Полный рабочий день',
                "salary": 'от 90 000 до 100 000 руб.'
              }
            ]
          }[:vacancies]
          # @vacancies = client.vacancies.body[:vacancies]
        end

        def new
          @vacancy = Vacancy.new
        end

        def create
          client.create_vacancy(permitted_params)
        end

        def edit
          @vacancy = OpenStruct
        end

        def update
          client.update_vacancy(options: permitted_params)
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
