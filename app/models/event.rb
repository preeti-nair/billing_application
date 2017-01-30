class Event < ActiveRecord::Base
  has_one :invoice
  def self.search(search)
    search ? where('lower(bill_to_name) LIKE ?', "%#{search.downcase}%") : all
  end
end
