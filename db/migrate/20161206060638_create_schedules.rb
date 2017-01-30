class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :duration
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
