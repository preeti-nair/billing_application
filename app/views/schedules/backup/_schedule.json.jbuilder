json.extract! schedule, :id, :start_time, :end_time, :duration, :client_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)