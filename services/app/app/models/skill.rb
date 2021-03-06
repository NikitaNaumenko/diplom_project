# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :account
  has_many :user_skills, class_name: 'User::Skill', dependent: :nullify

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { case_sensitive: false, scope: :account_id }
  scope :ordered, -> { order(id: :asc) }
end
