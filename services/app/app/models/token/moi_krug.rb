# frozen_string_literal: true

module Token
  class MoiKrug < ApplicationRecord
    belongs_to :account
  end
end
