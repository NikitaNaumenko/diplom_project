# frozen_string_literal: true

class AddPersonalInfoToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :patronymic
      t.datetime :birthdate
      t.string :work_state
      t.string :employee_number
      t.string :citizenship
      t.string :birthplace
      t.string :gender
      t.string :marital_status
    end
  end
end
