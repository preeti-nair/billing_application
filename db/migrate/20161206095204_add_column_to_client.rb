class AddColumnToClient < ActiveRecord::Migration
  def change
    add_column :clients, :is_active, :boolean, :default => false
  end
end
