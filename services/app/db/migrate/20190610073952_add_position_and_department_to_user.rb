# frozen_string_literal: true

class AddPositionAndDepartmentToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :position
    add_reference :users, :department
  end
end
