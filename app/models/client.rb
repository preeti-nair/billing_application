class Client < ActiveRecord::Base
  belongs_to :employee
  has_and_belongs_to_many :categories
  has_many :schedules
  
  validates :name, :contact_no, :project_name, :employee_id, :expected_schedule, presence: true
  validates :contact_no, numericality: true, length: {maximum: 10}
  validates :email_address,
                :uniqueness => true,
                :format => /.+@.+\..+/i
              
  def schedule_date
    self.expected_schedule.strftime("%Y-%d-%m")
  end
  def self.search(search)
    search ? where('lower(name) LIKE ?', "%#{search.downcase}%") : all
  end
  
  def self.bookings selector
    selector ? selector_bookings(selector) : all
  end
  
  def self.selector_bookings selector
    today = Date.today
    return where("date(expected_schedule) = ?",today) if selector == "today"
    start_date, end_date = ""
    if selector == "week"
      start_date = today.at_beginning_of_week
      end_date = today.at_end_of_week
    elsif selector == "month"
      start_date = today.at_beginning_of_month
      end_date = today.at_end_of_month
    end
    where("date(expected_schedule) between ? and ?",start_date, end_date )
  end
  
  def method_test
    a = [1,2,3]
    str = "preeti"
    str.re
  end
end
