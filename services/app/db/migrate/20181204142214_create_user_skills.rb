# frozen_string_literal: true

class CreateUserSkills < ActiveRecord::Migration[5.2]
  def change
    create_table(:user_skills, &:timestamps)
    add_reference :user_skills, :user, foreign_key: true
    add_reference :user_skills, :skill, foreign_key: true
    add_index :user_skills, %i[user_id skill_id]
  end
end
