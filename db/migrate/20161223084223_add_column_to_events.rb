class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :invoice_date, :datetime
  end
end
