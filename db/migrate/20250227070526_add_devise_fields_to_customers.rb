class AddDeviseFieldsToCustomers < ActiveRecord::Migration[7.0]
  def change
    change_table :customers, bulk: true do |t|
      ## Devise fields (excluding email)
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      ## Add indexes for Devise
      t.index :reset_password_token, unique: true
    end
  end
end
