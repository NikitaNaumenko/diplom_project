# frozen_string_literal: true

class User
  class Education < ApplicationRecord
    belongs_to :user
    belongs_to :education
  end
end
