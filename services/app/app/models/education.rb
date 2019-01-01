# frozen_string_literal: true

class Education < ApplicationRecord
  belongs_to :account
  has_many :user_educations, class_name: User::Education.name, dependent: :nullify

  validates :name, :code, presence: true
  validates :code, uniqueness: { case_sensitive: false, scope: :account_id }

  scope :ordered, -> { order(created_at: :asc) }
end
