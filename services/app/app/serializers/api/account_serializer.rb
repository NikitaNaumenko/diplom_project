module Api
  class AccountSerializer
    include FastJsonapi::ObjectSerializer

    set_id :id
  end
end
