# frozen_string_literal: true

class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end

    add_reference :departments, :account, foreign_key: true
    add_index :departments, :code
  end
end
