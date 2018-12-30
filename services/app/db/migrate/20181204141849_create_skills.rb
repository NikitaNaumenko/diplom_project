# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end

    add_reference :skills, :account, foreign_key: true
    add_index :skills, :code
    add_index :skills, %i[account_id code]
  end
end
