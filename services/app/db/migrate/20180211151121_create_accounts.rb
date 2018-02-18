class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.datetime :confirmated_at
      t.string :confirmation_code
      t.string :confirmation_sending_date

      t.timestamps
    end

    add_index :accounts, :name
  end
end
