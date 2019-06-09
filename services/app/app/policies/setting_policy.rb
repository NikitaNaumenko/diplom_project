# frozen_string_literal: true

class SettingPolicy < Struct.new(:user, :setting)
  def index?
    user.role.admin?
  end
end
