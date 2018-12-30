# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :account
  has_many :user_skills, class_name: User::Skill.name, dependent: :nullify

  validates :name, :code, presence: true
  validates :code, uniqueness: { case_sensitive: false, scope: :account_id }
end
