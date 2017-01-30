class CreateEvents < ActiveRecord::Migration
  def change
    enable_extension :hstore
    create_table :events do |t|
      t.string :bill_to_name
      t.string :bill_to_address
      t.string :invoice_no
      t.hstore :particulars
      t.hstore :tax
      t.integer :total

      t.timestamps null: false
    end
  end
end
