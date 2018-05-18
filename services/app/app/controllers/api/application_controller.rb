# frozen_string_literal: true

module Api
  # Base controller for application
  class ApplicationController < ActionController::API
    include Api::Concerns::Responders
  end
end
