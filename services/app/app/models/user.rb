# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  belongs_to :account
  has_many :user_skills, class_name: User::Skill.name, dependent: :nullify
  has_many :skills, through: :user_skills

  before_validation :email_from_account, if: proc { email.nil? }

  validates :first_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, scope: :account }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  private

  def email_from_account
    self.email = account.email
  end
end
