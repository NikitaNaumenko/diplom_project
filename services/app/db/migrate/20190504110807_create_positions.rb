# frozen_string_literal: true

class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end

    add_reference :positions, :account, foreign_key: true
    add_index :positions, :code
  end
end
