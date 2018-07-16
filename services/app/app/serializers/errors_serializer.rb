# frozen_string_literal: true

# Serialized validation errors
class ErrorsSerializer
  def initialize(model, errors)
    @errors = errors
    @model = model
  end

  def serialized_json
    { data:
      { id: model.name.downcase,
        type: model.name.downcase,
        errors: errors } }
  end

  private

  attr_accessor :errors, :model
end
