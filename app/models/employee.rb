class Employee < ActiveRecord::Base
	has_many :clients
  has_one :user
end
