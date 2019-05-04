# frozen_string_literal: true

class Account < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :users, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :moi_krug_secrets, class_name: 'Account::MoiKrugSecret', dependent: :destroy
  has_one :moi_krug_token, class_name: 'Token::MoiKrug', dependent: :destroy

  before_save { self.email = email.downcase }

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  accepts_nested_attributes_for :users

  delegate :present?, to: :moi_krug_token, prefix: true
end
