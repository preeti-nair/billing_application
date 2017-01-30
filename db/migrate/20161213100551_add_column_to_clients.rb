class AddColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :expected_schedule, :timestamp
  end
end
