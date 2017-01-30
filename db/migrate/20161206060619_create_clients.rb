class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :contact_no, limit: 8
      t.string :email_address
      t.string :project_name
      t.string :identity_document
      t.string :identity_number
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
