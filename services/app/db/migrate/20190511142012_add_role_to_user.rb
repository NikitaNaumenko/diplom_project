# frozen_string_literal: true

class AddRoleToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :string
  end

  def down
    remove_columns :users, :role
  end
end
