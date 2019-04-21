# frozen_string_literal: true

class User
  class FamilyMember < ApplicationRecord
    extend Enumerize
    belongs_to :user

    enumerize :kinship, in: %i[mother father sister brother]
  end
end
