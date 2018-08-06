# frozen_string_literal: true

# Responder for api request
module Responders
  extend ActiveSupport::Concern

  included do
    private

    def respond_for_create(record, serializer)
      render json: serializer.new(record).serialized_json, status: :created
    end

    def respond_for_validation_errors(model, errors, serializer)
      render json: serializer.new(model, errors).serialized_json, status: :unprocessable_entity
    end
  end
end
