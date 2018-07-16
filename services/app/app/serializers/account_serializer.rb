# frozen_string_literal: true

# Serialize account model
class AccountSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :phone
end
