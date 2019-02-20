# frozen_string_literal: true

class User < ApplicationRecord
  include AASM
  extend Enumerize

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_secure_password

  belongs_to :account
  has_many :user_skills, class_name: User::Skill.name, dependent: :nullify
  has_many :skills, through: :user_skills
  has_many :user_educations, class_name: User::Education.name, dependent: :nullify
  has_many :educations, through: :user_educations

  before_validation :email_from_account, if: proc { email.nil? }
  before_save { self.email = email.downcase }

  validates :first_name, :email, presence: true
  validates :password, presence: { on: :create }, length: { minimum: 4, allow_blank: true }
  validates :email, uniqueness: { case_sensitive: false, scope: :account }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  enumerize :gender, in: %i[male female]
  enumerize :marital_status, in: %i[widowed civil_marriage married divorced single]

  aasm(column: :work_state) do
    state :doesnt_work, initial: true
    state :works

    event :recruitment do
      transitions from: :doesnt_work, to: :works
    end

    event :dismiss do
      transitions from: :works, to: :doesnt_work
    end
  end

  def full_name
    "#{last_name} #{first_name} #{patronymic}"
  end

  private

  def email_from_account
    self.email = account.email
  end
end
