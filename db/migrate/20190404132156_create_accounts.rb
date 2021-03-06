class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :email
      t.boolean :admin, default: false
      t.string :password_digest

      t.timestamps
    end
  end
end
