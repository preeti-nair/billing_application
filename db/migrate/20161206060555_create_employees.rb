class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :emp_id, limit: 8
      t.string :name
      t.integer :contact_no, limit: 8
      t.string :email_address
      t.string :identity_document
      t.string :identity_number

      t.timestamps null: false
    end
  end
end
