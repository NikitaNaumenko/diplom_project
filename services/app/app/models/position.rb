# frozen_string_literal: true

class Position < ApplicationRecord
  belongs_to :account

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { case_sensitive: false, scope: :account_id }
  scope :ordered, -> { order(id: :asc) }
end
