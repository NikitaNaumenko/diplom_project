# frozen_string_literal: true

class UserMutator
  class << self
    def create!(params)
      UserType.create(params)
    end
  end
end
