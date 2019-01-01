# frozen_string_literal: true

class CreateUserEducations < ActiveRecord::Migration[5.2]
  def change
    create_table(:user_educations, &:timestamps)
    add_reference :user_educations, :user, foreign_key: true
    add_reference :user_educations, :education, foreign_key: true
    add_index :user_educations, %i[user_id education_id]
  end
end
