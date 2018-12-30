# frozen_string_literal: true

class Account < ApplicationRecord
  has_settings do |s|
    s.key :moi_krug, defaults: {
      client_id: nil,
      client_secret: nil
    }
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :users, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_one :moi_krug_token, class_name: Token::MoiKrug.name, dependent: :destroy

  before_save { self.email = email.downcase }

  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  accepts_nested_attributes_for :users
end
