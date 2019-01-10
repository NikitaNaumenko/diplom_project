# frozen_string_literal: true

module Users
  # Serializer for User.new
  class NewSerializer
    include FastJsonapi::ObjectSerializer
    attributes :first_name
  end
end
