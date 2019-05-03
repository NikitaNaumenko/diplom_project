# frozen_string_literal: true

class CreateAccountMoiKrugSecrets < ActiveRecord::Migration[5.2]
  def change
    create_table :account_moi_krug_secrets do |t|
      t.string :client_id
      t.string :client_secret

      t.timestamps
    end

    add_reference :account_moi_krug_secrets, :account, foreign_key: true
  end
end
