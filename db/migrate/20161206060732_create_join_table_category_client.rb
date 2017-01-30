class CreateJoinTableCategoryClient < ActiveRecord::Migration
  def change
    create_join_table :categories, :clients do |t|
       	#t.belongs_to :categories
    	#t.belongs_to :clients
    end
  end
end
