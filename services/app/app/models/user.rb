# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_secure_password

  belongs_to :account
  has_many :user_skills, class_name: User::Skill.name, dependent: :nullify
  has_many :skills, through: :user_skills
  has_many :user_educations, class_name: User::Education.name, dependent: :nullify
  has_many :educations, through: :user_educations

  before_validation :email_from_account, if: proc { email.nil? }
  before_save { self.email = email.downcase }

  validates :first_name, :email, :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false, scope: :account }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  private

  def email_from_account
    self.email = account.email
  end
end
