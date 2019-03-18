# frozen_string_literal: true

class User
  class FamilyMember < ApplicationRecord
    belongs_to :user
  end
end
