# frozen_string_literal: true

class User
  class Skill < ApplicationRecord
    belongs_to :user
    belongs_to :skill
  end
end
