# frozen_string_literal: true

# Serializer for user model
class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name
end
