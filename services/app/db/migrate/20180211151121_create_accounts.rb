class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :registred_user_name, null: false
      t.string :email, null: false
      t.string :phone
      t.datetime :confirmated_at
      t.string :confirmation_code
      t.datetime :confirmation_sending_date

      t.timestamps
    end

    add_index :accounts, :name
  end
end
