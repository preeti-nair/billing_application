class AddBreakUpColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :break_up_costing, :string
  end
end
