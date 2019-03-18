# frozen_string_literal: true

class CreateUserFamilyMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_family_members do |t|
      t.string :kinship
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.datetime :birthdate

      t.timestamps
    end

    add_reference :user_family_members, :user, foreign_key: true
  end
end
