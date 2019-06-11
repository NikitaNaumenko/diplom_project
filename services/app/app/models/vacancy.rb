# frozen_string_literal: true

class Vacancy
  include ActiveModel::Model
  extend ActiveModel::Translation
  extend ActiveModel::Naming


  
  attr_accessor :title, :salary_from, :salary_to, :currency,
                :city_id, :remote, :employment_type, :description,
                :skills, :divisions
end
