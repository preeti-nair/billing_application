class Rate < ActiveRecord::Base
	belongs_to :category
	validates :category_id, presence: true
	validates :value, presence: true
end
