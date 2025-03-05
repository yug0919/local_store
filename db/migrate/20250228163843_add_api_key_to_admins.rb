class AddApiKeyToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :api_key, :string
  end
end
