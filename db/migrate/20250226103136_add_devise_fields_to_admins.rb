class AddDeviseFieldsToAdmins < ActiveRecord::Migration[8.0]
  def change
      change_table :admins, bulk: true do |t|
        t.string :encrypted_password, null: false, default: ""
        t.string :reset_password_token
        t.datetime :reset_password_sent_at
        t.datetime :remember_created_at
      end
  
      add_index :admins, :reset_password_token, unique: true
   
  end
end
