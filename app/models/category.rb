class Category < ActiveRecord::Base
  has_one :rate
  has_and_belongs_to_many :clients
end
