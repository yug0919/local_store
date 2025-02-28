class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :message
      t.string :status
      t.datetime :sent_at

      t.timestamps
    end
  end
end
