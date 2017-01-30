class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :category
      t.integer :year
      t.integer :invoice_identifier
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
