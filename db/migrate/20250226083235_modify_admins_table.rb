class ModifyAdminsTable < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :last_login_at, :datetime
    add_column :admins, :last_login_ip, :string
    add_column :admins, :failed_attempts, :integer, default: 0
    add_column :admins, :locked_at, :datetime
    add_column :admins, :status, :string, default: "active"  # active, suspended
    add_column :admins, :role, :string, default: "superadmin"   # superadmin, manager, support

    add_index :admins, :email, unique: true
    add_index :admins, :username, unique: true
    
  end
end
