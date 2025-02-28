class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :order, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :invoice_number
      t.decimal :amount_due
      t.string :status
      t.datetime :generated_at

      t.timestamps
    end
  end
end
