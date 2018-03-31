module Api
  module Concerns
    module Responders
      extend ActiveSupport::Concern

      included do
        private

        def respond_for_save(record, serializer)
          if record.errors.any?
            render json: { error: record.errors.messages }, status: :unprocessable_entity
          else
            render json: serializer.new(record).serialized_json
          end
        end

        def respond_for_validation_errors(errors)
          render json: { errors: errors }, status: :unprocessable_entity
        end
      end
    end
  end
end
