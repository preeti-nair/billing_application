module RatesHelper
	def get_categories
		Category.all
	end
	def get_message_string rate
		"#{rate.category.name} Rates are #{rate.value} per hour"
	end
end
