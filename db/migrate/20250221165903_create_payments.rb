class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :amount_paid
      t.string :payment_method
      t.datetime :payment_date

      t.timestamps
    end
  end
end
