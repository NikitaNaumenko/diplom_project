# Generate users table
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :inner_id, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :patronymic
      t.string :email, null: false
      t.string :login, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    add_reference :users, :account, index: true
    add_index :users, %i[account_id inner_id]
    add_index :users, %i[account_id email]
    add_index :users, %i[account_id login]
  end
end
