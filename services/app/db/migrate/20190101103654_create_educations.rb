# frozen_string_literal: true

class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end

    add_reference :educations, :account, foreign_key: true
    add_index :educations, :code
    add_index :educations, %i[account_id code]
  end
end
