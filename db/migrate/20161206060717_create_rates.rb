class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :value, limit: 8
      t.references :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
