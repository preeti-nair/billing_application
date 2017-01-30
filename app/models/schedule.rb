class Schedule < ActiveRecord::Base
  belongs_to :client
  #attr_accessor :start_time, :client_id
end
