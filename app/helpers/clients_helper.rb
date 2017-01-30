module ClientsHelper
	def get_employees
		Employee.all
	end
	def get_categories
		Category.all
	end
	def get_local_time time_string, format="%d/%m/%y %H:%M:%S"
		time_string.localtime.strftime(format)
	end
  def get_table_header_selector selector
    today = Date.today
    case selector
      when "today" then "Schedules for today: #{today}"
      when "week" then "Schedules for this week: #{today.at_beginning_of_week} to #{today.at_end_of_week}"
      when "month" then "Schedules for this month: #{today.at_beginning_of_month} to #{today.at_end_of_month}"
    else
      "All Schedules"
    end
  end
end
