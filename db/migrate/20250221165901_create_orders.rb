class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :total_amount
      t.string :status
      t.datetime :order_date

      t.timestamps
    end
  end
end
