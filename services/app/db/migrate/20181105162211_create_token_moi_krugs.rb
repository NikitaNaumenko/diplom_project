# frozen_string_literal: true

class CreateTokenMoiKrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :token_moi_krugs do |t|
      t.string :access_token, null: false

      t.timestamps
    end

    add_reference :token_moi_krugs, :account, foreign_key: true
  end
end
