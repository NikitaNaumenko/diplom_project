# frozen_string_literal: true

module UsersRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { order(id: :desc) }
  end
end
