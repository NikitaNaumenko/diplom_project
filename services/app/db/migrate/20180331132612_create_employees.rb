class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.string :login
      t.string :password_digest

      t.timestamps
    end

    add_reference :employees, :account, index: true
    add_index :employees, :email
    add_index :employees, :login
  end
end
