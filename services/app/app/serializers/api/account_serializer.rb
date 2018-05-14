module Api
  class AccountSerializer
    include FastJsonapi::ObjectSerializer

    set_id :id
    attributes :name
  end
end