# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.datetime :confirmation_at
      t.string :confirmation_code
      t.string :confirmation

      t.timestamps
    end

    add_index :accounts, :name
    add_index :accounts, :email
  end
end
